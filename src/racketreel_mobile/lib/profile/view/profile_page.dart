import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/profile/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                                : Text(getInitials(state.displayName!)),
                          ),
                        ),
                        Text(
                          state.displayName ?? "No display name",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  ListView(
                    padding: const EdgeInsets.all(20),
                    children: const [
                      Text("user's matches here"),
                      Text("user's matches here"),
                      Text("user's matches here"),
                      Text("user's matches here"),
                    ]
                  )
                ],
              )
        )
      )
    );

  String getInitials(String name) {
    // Split the name by spaces
    List<String> words = name.split(' ');

    // Filter out any empty strings (in case of multiple spaces)
    words = words.where((word) => word.isNotEmpty).toList();

    // Map each word to its first character, convert to uppercase, and join them
    String initials = words.map((word) => word[0].toUpperCase()).join('');

    return initials;
  }
}