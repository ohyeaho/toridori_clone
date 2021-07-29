import 'package:flutter/material.dart';
import 'package:toridori_clone/components/main_page_appbar.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPageAppbar(
        title: Text(
          'キャンペーンを探す',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: SafeArea(child: MainPageDrawer()),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              width: 200,
              height: 70,
              child: DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.black,
                    bottom: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.red.shade800,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      tabs: [
                        Tab(
                          child: Text('新着順'),
                        ),
                        Tab(
                          child: Text('人気順'),
                        ),
                        Tab(
                          child: Text('報酬順'),
                        ),
                        Tab(
                          child: Text('本来の提供価格順'),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Icon(Icons.directions_car),
                      Icon(Icons.directions_transit),
                      Icon(Icons.directions_bike),
                      Icon(Icons.directions_car),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              borderRadius: BorderRadius.circular(35),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.red.shade800,
                ),
                height: 60,
                child: Center(
                  child: Text(
                    '条件を変更する',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
