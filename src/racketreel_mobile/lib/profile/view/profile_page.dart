import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  final String? userId;

  const ProfilePage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(userId ?? "");
}