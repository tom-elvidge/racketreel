import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/feed/presentation/bloc/feed_bloc.dart';
import 'package:racketreel/feed/presentation/view/feed_page.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/profile/bloc/profile_bloc.dart';
import 'package:racketreel/profile/view/profile_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Theme.of(context).colorScheme.primary,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
      body: <Widget>[
        BlocProvider(
          create: (_) => getIt<FeedBloc>()..add(const FetchInitialEvent()),
          child: const FeedPage(),
        ),
        BlocProvider(
          create: (_) => getIt<ProfileBloc>()
            ..add(Initialize(userId: FirebaseAuth.instance.currentUser?.uid)),
          child: const ProfilePage(),
        )
      ][currentPageIndex],
    );
  }
}
