// class CampaignListPage extends StatelessWidget {
//   const CampaignListPage({Key? key}) : super(key: key);

// class CampaignListPage extends StatefulWidget {
//   const CampaignListPage({Key? key}) : super(key: key);
//
//   @override
//   _CampaignListPageState createState() => _CampaignListPageState();
// }
//
// class _CampaignListPageState extends State<CampaignListPage> {
//   with SingleTickerProviderStateMixin {
//   TabController _tabController;
//
//   @override
//   void initState() {
//   _tabController = TabController(length: 4, vsync: this);
//   super.initState();
//   }
//
//   @override
//   void dispose() {
//   super.dispose();
//   _tabController.dispose();
//   }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   return Scaffold(
//   appBar: BackAppbar(title: 'キャンペーン一覧'),
//   body: NestedScrollView(
//   headerSliverBuilder: (context, value) {
//   return [
//   SliverAppBar(
//   title: Text('140件の検索結果'),
//   bottom: PreferredSize(
//   preferredSize: Size.fromHeight(kToolbarHeight),
//   child: _buildTabsRow()
//   // Stack(
//   //                 children: [
//   //                   Row(
//   //                     children: [
//   //                       Expanded(
//   //                         flex: 3,
//   //                         child: TabBar(
//   //                           tabs: [
//   //                             Tab(text: '新着順'),
//   //                             Tab(text: '新着順'),
//   //                             Tab(text: '新着順')
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                   Expanded(flex: 2, child: Container())
//   //                 ],
//   //               ),
//   ),
//   ),
//   ];
//   },
//   body: _tabBody(),
//   // body: TabBarView(
//   // children: [
//   // Expanded(child: Placeholder()),
//   // Expanded(child: Placeholder()),
//   // Expanded(child: Placeholder())
//   // ],
//   // ),
//   ),
//   // body: Container(
//   //   height: 100,
//   //   child: Row(
//   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //     children: [
//   //       Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           Text('140件の検索結果'),
//   //           DefaultTabController(
//   //             length: 4,
//   //             child: Container(
//   //               constraints: BoxConstraints(maxWidth: 250, maxHeight: 50),
//   //               child: Column(
//   //                 children: [
//   //                   TabBar(
//   //                     tabs: [
//   //                       Tab(text: '新着順'),
//   //                       Tab(text: '人気順'),
//   //                       Tab(text: '報酬順'),
//   //                       Tab(text: '本来の提供価格順'),
//   //                     ],
//   //                   ),
//   //                   TabBarView(
//   //                     children: [
//   //                       Tab(child: Expanded(child: Placeholder())),
//   //                       Tab(child: Expanded(child: Placeholder())),
//   //                       Tab(child: Expanded(child: Placeholder())),
//   //                       Tab(child: Expanded(child: Placeholder()))
//   //                     ],
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //           )
//   //           // Row(
//   //           //   children: [
//   //           //     Text('新着順'),
//   //           //     Text('人気順'),
//   //           //     Text('報酬順'),
//   //           //     Text('本来の提供価格順'),
//   //           //   ],
//   //           // )
//   //         ],
//   //       ),
//   //       Text('条件を変更する')
//   //     ],
//   //   ),
//   // ),
//   );
//   }
//     // DefaultTabController(
//     //   length: 4,
//     //   child: Scaffold(
//     //     appBar: AppBar(
//     //       backgroundColor: Colors.black,
//     //       centerTitle: true,
//     //       title: Text(
//     //         'キャンペーン一覧',
//     //         style: TextStyle(fontWeight: FontWeight.bold),
//     //       ),
//     //       bottom: TabBar(
//     //         indicatorColor: Colors.red.shade800,
//     //         tabs: [
//     //           Tab(child: Text('新着順')),
//     //           Tab(child: Text('人気順')),
//     //           Tab(child: Text('報酬順')),
//     //           Tab(child: Text('本来の提供価格順')),
//     //         ],
//     //       ),
//     //     ),
//     //     // BackAppbar(title: 'キャンペーン一覧'),
//     //     body: TabBarView(
//     //       children: [
//     //         Column(
//     //           children: [Expanded(child: Placeholder())],
//     //         ),
//     //         Column(
//     //           children: [Expanded(child: Placeholder())],
//     //         ),
//     //         Column(
//     //           children: [Expanded(child: Placeholder())],
//     //         ),
//     //         Column(
//     //           children: [Expanded(child: Placeholder())],
//     //         )
//     //       ],
//     //     ),
//     //   ),
//     // );
//   Widget _tabBody(){
//       return TabBarView(
//       controller: _tabController,
//       children: [
//   Expanded(child: Placeholder()),
//   Expanded(child: Placeholder()),
//   Expanded(child: Placeholder()),
//   Expanded(child: Placeholder())
//       ],);
//   }
//
//   Widget _buildTabsRow() {
//       return Stack(
//       children: [
//       _buildTabTitles(),
//   _buildTabActions()
//   ],
//       );
//   }
//
//   Widget _buildTabTitles() {
//       return  Row(
//       children: [
//       Expanded(
//       flex: 3,
//   child: TabBar(
//   controller: _tabController,
//   tabs: [
//   Tab(text: '新着順'),
//   Tab(text: '新着順'),
//   Tab(text: '新着順'),
//   Tab(text: '新着順')
//   ],
//   ),
//   ),
//   Expanded(flex: 2, child: Container())
//   ],
//   );
//   }
//
//   Widget _buildTabActions() {
//       return Text('条件を変更する');
//   }
//   }

import 'package:flutter/material.dart';
import 'package:toridori_clone/components/back_appbar.dart';

class CampaignListPage extends StatefulWidget {
  const CampaignListPage({Key? key}) : super(key: key);

  @override
  _CampaignListPageState createState() => _CampaignListPageState();
}

class _CampaignListPageState extends State<CampaignListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackAppbar.createAppBar('キャンペーン一覧'),
        body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.black,
                    automaticallyImplyLeading: false,
                    // title: Text('Library'),
                    bottom: PreferredSize(preferredSize: Size.fromHeight(30), child: _buildTabsRow())),
              ];
            },
            body: _tabBody()));
  }

  Widget _tabBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(child: Center(child: Icon(Icons.car_rental, color: Colors.white))),
        Container(child: Center(child: Icon(Icons.car_rental, color: Colors.white))),
        Container(child: Center(child: Icon(Icons.car_rental, color: Colors.white))),
        // Container(
        //     child: Center(child: Icon(Icons.car_rental, color: Colors.white))),
      ],
    );
  }

  Widget _buildTabsRow() {
    return Stack(
      children: [_buildTabTitles(), _buildTabActions()],
    );
  }

  // タブの左寄せタイトル郡
  Widget _buildTabTitles() {
    return Row(
      children: [
        Expanded(
          flex: 3,
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
                    labelPadding: EdgeInsets.symmetric(horizontal: 10),
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
          // child: TabBar(
          //   controller: _tabController,
          //   indicator: BoxDecoration(
          //     border: Border(
          //         bottom: BorderSide(
          //       // width: getProportionWidth(3),
          //       color: Colors.white,
          //     )),
          //   ),
          //   labelColor: Colors.white,
          //   unselectedLabelColor: Colors.grey,
          //   tabs: [
          //     _tabTitle('C'),
          //     _tabTitle('B'),
          //     _tabTitle('W'),
          //     // _tabTitle('W'),
          //   ],
          // ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            borderRadius: BorderRadius.circular(35),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.red.shade800,
              ),
              height: 70,
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
    );
  }

  Widget _buildTabActions() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text('140件の検索結果'),
    );
  }

  // Widget _tabAction({@required Icon icon, @required Function onTap}) {
  //   return Padding(
  //     padding: EdgeInsets.only(right: getProportionWidth(20)),
  //     child: GestureDetector(
  //       onTap: () => onTap,
  //       child: icon,
  //     ),
  //   );
  // }
  //
  Widget _tabTitle(String title) {
    return Container(
      // height: getProportionHeight(40),
      // width: getProportionWidth(132),
      child: Tab(text: title),
    );
  }
}
