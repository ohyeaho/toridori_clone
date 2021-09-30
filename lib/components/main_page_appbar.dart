import 'package:flutter/material.dart';
import 'package:toridori_clone/screens/appbar_drawer/check_offer_page.dart';

class MainPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  final Size preferredSize;

  MainPageAppbar({required this.title}) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: title,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckOfferPage()),
            );
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
