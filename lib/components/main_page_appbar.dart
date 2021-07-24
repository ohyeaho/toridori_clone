import 'package:flutter/material.dart';

class MainPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  final Size preferredSize;

  MainPageAppbar({required this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: title,
      actions: [
        IconButton(
          onPressed: () {
            // todo: ボタン処理
          },
          icon: Icon(
            Icons.check,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
