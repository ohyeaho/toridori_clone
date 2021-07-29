import 'package:flutter/material.dart';
import 'package:toridori_clone/components/main_page_appbar.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPageAppbar(
        title: Text(
          'お気に入り',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: SafeArea(child: MainPageDrawer()),
    );
  }
}
