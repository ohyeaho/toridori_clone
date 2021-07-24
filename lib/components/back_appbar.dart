import 'package:flutter/material.dart';

class BackAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Size preferredSize;

  BackAppbar({required this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
