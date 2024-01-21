import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: const ProfileScreen(
          showDeleteConfirmationDialog: true,
          showMFATile: true,
          showUnlinkConfirmationDialog: true,
        )
      );
  }
}