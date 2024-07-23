import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/profile/bloc/profile_bloc.dart';
import 'package:racketreel/profile/view/live_match_item.dart';
import 'package:racketreel/scoring/presentation/view/scoring_page.dart';
import 'package:racketreel/shared/domain/name_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isNearEndOfScroll()) {
      context.read<ProfileBloc>().add(const LiveMatchesFetchOlderEvent());
    }
  }

  bool _isNearEndOfScroll()
  {
    // remaining scroll is equal to the height of the viewport
    var scrollOffset = _scrollController.offset;
    var maxScroll = _scrollController.position.maxScrollExtent;
    var viewportDimension = _scrollController.position.viewportDimension;
    return scrollOffset >= (maxScroll - viewportDimension);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            state.isInitializing
              ? ""
              : state.userIsCurrentUser
                ? "Profile"
                : state.displayName ?? "User"),
          actions: state.isInitializing
            ? []
            : <Widget>[
              IconButton(
                icon: const Icon(Icons.more_vert),
                tooltip: 'More',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_)
                    {
                      return BlocProvider.value(
                        value: BlocProvider.of<ProfileBloc>(context),
                        child: SafeArea(
                          child: Wrap(
                            children: state.userIsCurrentUser
                              ? [
                                ListTile(
                                  title: const Text('Update display name'),
                                  onTap: () async {
                                    var controller = TextEditingController();

                                    await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Update display name'),
                                          content: TextField(
                                            controller: controller,
                                            decoration: const InputDecoration(hintText: "Display name"),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                controller.text = "";
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      }
                                    );

                                    if (!context.mounted) return;

                                    if (controller.text.trim().isNotEmpty) {
                                      context
                                        .read<ProfileBloc>()
                                        .add(UpdateDisplayName(displayName: controller.text));
                                    }

                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Sign out'),
                                  onTap: () {
                                    context
                                        .read<ProfileBloc>()
                                        .add(SignOut());

                                    Navigator.pop(context);
                                  },
                                )
                              ]
                              : [],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
        ),
        body: SafeArea(
          child: state.isInitializing
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                displacement: 20.0,
                onRefresh: () async => context
                    .read<ProfileBloc>()
                    .add(Refresh()),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              child: state.displayName == null
                                  ? const Text("U")
                                  : Text(NameHelper.getInitials(state.displayName!)),
                            ),
                          ),
                          Text(
                            state.displayName ?? "No display name",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: Builder(
                          builder: (BuildContext newContext) {
                            // Using the new context that has access to the BlocProvider
                            return CustomScrollView(
                              controller: _scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              slivers: <Widget>[
                                // Load new feed items when coming back to this page
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      final item = state.liveMatchesItems[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        child: InkWell(
                                          child: LiveMatchItem(
                                            liveMatchEntity: item,
                                            userDisplayName: state.displayName ?? "",
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ScoringPage(matchId: item.matchId),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    childCount: state.liveMatchesItems.length,
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: state.liveMatchesFetchingOlder
                                      ? Container(
                                    padding: const EdgeInsets.all(20),
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                      : const SizedBox.shrink(),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
          )
        )
      )
    );
}