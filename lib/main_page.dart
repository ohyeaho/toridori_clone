import 'package:flutter/material.dart';
import 'package:toridori_clone/screens/favorite_page.dart';
import 'package:toridori_clone/screens/home/home_page.dart';
import 'package:toridori_clone/screens/offer_page.dart';
import 'package:toridori_clone/screens/search_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    OfferPage(),
    FavoritePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '探す',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_outlined),
            label: 'オファー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'お気に入り',
          ),
        ],
        iconSize: 30,
        selectedFontSize: 13,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 13,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey.shade600,
      ),
    );
  }
}
