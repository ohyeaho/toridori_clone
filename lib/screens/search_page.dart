import 'package:flutter/material.dart';
import 'package:toridori_clone/components/condition_end_drawer.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';
import 'package:toridori_clone/screens/appbar_drawer/check_offer_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'キャンペーンを探す',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
        bottom: PreferredSize(preferredSize: Size.fromHeight(48), child: _buildTabsRow()),
      ),
      drawer: SafeArea(child: MainPageDrawer()),
      endDrawer: SafeArea(child: ConditionEndDrawer()),
      body: _tabBody(),
    );
  }

  Widget _tabBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(child: Center(child: Icon(Icons.car_rental, color: Colors.white, size: 100))),
        Container(child: Center(child: Icon(Icons.car_rental, color: Colors.white, size: 100))),
        Container(child: Center(child: Icon(Icons.car_rental, color: Colors.white, size: 100))),
        Container(child: Center(child: Icon(Icons.car_rental, color: Colors.white, size: 100))),
      ],
    );
  }

  Widget _buildTabsRow() {
    return Stack(
      children: [
        _buildTabTitles(),
        _buildTabActions(),
      ],
    );
  }

  /// タブの左寄せタイトル
  Widget _buildTabTitles() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red.shade800,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
            labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            tabs: [
              Tab(text: '新着順'),
              Tab(text: '人気順'),
              Tab(text: '報酬順'),
              Tab(text: '本来の提供価格順'),
            ],
          ),
        ),
        Expanded(flex: 3, child: Container()),
      ],
    );
  }

  /// タブ右寄せボタン
  Widget _buildTabActions() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          _key.currentState!.openEndDrawer();
        },
        child: Text(
          '条件を変更する',
          style: TextStyle(fontSize: 16),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          primary: Colors.white,
          backgroundColor: Colors.red.shade800,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
