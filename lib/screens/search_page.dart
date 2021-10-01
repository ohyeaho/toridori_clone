import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toridori_clone/components/condition_end_drawer.dart';
import 'package:toridori_clone/components/loading_widget.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';
import 'package:toridori_clone/models/rakuten_api.dart';
import 'package:toridori_clone/screens/appbar_drawer/check_offer_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Item>? item;
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: _tabBody(),
      ),
    );
  }

  Widget _tabBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        _tabSortNew(),
        _tabSortNew(),
        _tabSortNew(),
        _tabSortNew(),
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

  Widget _tabSortNew() {
    return FutureBuilder(
      future: Item.getItem('おすすめ'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          item = snapshot.data;
          return snapshot.data != null
              ? ListView(
                  children: [
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // grid数
                          crossAxisSpacing: 18, // grid間横スペース
                          mainAxisSpacing: 20, // grid間縦スペース
                          childAspectRatio: 0.65, // grid大きさ
                        ),
                        physics: NeverScrollableScrollPhysics(), // listスクロール無効
                        shrinkWrap: true, // list余白削除
                        itemCount: item!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 28,
                                child: Image.network(
                                  '${item![index].image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                  flex: 13,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          '${item![index].name}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.instagram,
                                                    color: Colors.purple,
                                                    size: 15,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    '${item![index].price}人以上',
                                                    style: TextStyle(fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          );
                        }),
                  ],
                )
              : Center(child: LoadingWidget.circleLoading);
        } else {
          return Center(child: LoadingWidget.circleLoading);
        }
      },
    );
  }
}
