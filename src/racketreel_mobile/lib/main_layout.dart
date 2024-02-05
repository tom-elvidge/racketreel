import 'package:flutter/material.dart';
import 'package:racketreel/auth/presentation/view/profile_page.dart';
import 'package:racketreel/feed/presentation/view/feed_page.dart';
import 'package:racketreel/video_scoring/presentation/view/video_scoring_page.dart';

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
          ),
          NavigationDestination(
            icon: Icon(Icons.video_camera_back),
            label: 'Scoring',
          ),
        ],
      ),
      body: <Widget>[
        FeedPage(),
        ProfilePage(),
        VideoScoringRootPage()
      ][currentPageIndex],
    );
  }
}
