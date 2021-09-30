// import 'package:flutter/material.dart';
// import 'package:toridori_clone/components/main_page_appbar.dart';
// import 'package:toridori_clone/components/main_page_drawer.dart';
//
// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // return DefaultTabController(
//     //   length: 4,
//     //   child: Stack(
//     //     children: [
//     //       Scaffold(
//     //         appBar: AppBar(
//     //           backgroundColor: Colors.black,
//     //           centerTitle: true,
//     //           title: Text(
//     //             'キャンペーンを探す',
//     //             style: TextStyle(fontWeight: FontWeight.bold),
//     //           ),
//     //           actions: [
//     //             IconButton(
//     //               onPressed: () {
//     //                 Navigator.push(
//     //                   context,
//     //                   MaterialPageRoute(builder: (context) => CheckOfferPage()),
//     //                 );
//     //               },
//     //               icon: Icon(
//     //                 Icons.check,
//     //                 color: Colors.red,
//     //               ),
//     //             ),
//     //           ],
//     //           bottom: TabBar(
//     //             isScrollable: true,
//     //             unselectedLabelColor: Colors.grey,
//     //             indicatorColor: Colors.red.shade800,
//     //             indicatorSize: TabBarIndicatorSize.label,
//     //             indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
//     //             labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//     //             tabs: [
//     //               Tab(child: Text('新着順')),
//     //               Tab(child: Text('人気順')),
//     //               Tab(child: Text('報酬順')),
//     //               Tab(child: Text('本来の提供価格順')),
//     //             ],
//     //           ),
//     //         ),
//     //         drawer: SafeArea(child: MainPageDrawer()),
//     //         body: TabBarView(
//     //           children: [
//     //             Icon(
//     //               Icons.directions_bike,
//     //               color: Colors.white,
//     //             ),
//     //             Icon(
//     //               Icons.directions_car,
//     //               color: Colors.white,
//     //             ),
//     //             Icon(
//     //               Icons.directions_train,
//     //               color: Colors.white,
//     //             ),
//     //             Icon(
//     //               Icons.directions_boat,
//     //               color: Colors.white,
//     //             ),
//     //           ],
//     //         ),
//     //       ),
//     //       Positioned(
//     //         top: 65,
//     //         left: 240,
//     //         child: TextButton(
//     //           onPressed: () {},
//     //           child: Text(
//     //             '条件を変更する',
//     //             style: TextStyle(fontSize: 16),
//     //           ),
//     //           style: TextButton.styleFrom(
//     //             padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
//     //             primary: Colors.white,
//     //             backgroundColor: Colors.red.shade800,
//     //             shape: StadiumBorder(),
//     //           ),
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );
//     return Scaffold(
//       appBar: MainPageAppbar(
//         title: Text(
//           'キャンペーンを探す',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       drawer: SafeArea(child: MainPageDrawer()),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 5,
//             child: SizedBox(
//               width: 200,
//               height: 70,
//               child: DefaultTabController(
//                 length: 4,
//                 child: Scaffold(
//                   appBar: AppBar(
//                     automaticallyImplyLeading: false,
//                     backgroundColor: Colors.black,
//                     bottom: TabBar(
//                       isScrollable: true,
//                       unselectedLabelColor: Colors.grey,
//                       indicatorColor: Colors.red.shade800,
//                       indicatorSize: TabBarIndicatorSize.label,
//                       indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
//                       labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                       tabs: [
//                         Tab(child: Text('新着順')),
//                         Tab(child: Text('人気順')),
//                         Tab(child: Text('報酬順')),
//                         Tab(child: Text('本来の提供価格順')),
//                       ],
//                     ),
//                   ),
//                   body: TabBarView(
//                     children: [
//                       Icon(Icons.directions_car, color: Colors.white, size: 100),
//                       Icon(Icons.directions_transit, color: Colors.white, size: 100),
//                       Icon(Icons.directions_bike, color: Colors.white, size: 100),
//                       Icon(Icons.directions_car, color: Colors.white, size: 100),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: TextButton(
//               onPressed: () {},
//               child: Text(
//                 '条件を変更する',
//                 style: TextStyle(fontSize: 16),
//               ),
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 18),
//                 primary: Colors.white,
//                 backgroundColor: Colors.red.shade800,
//                 shape: StadiumBorder(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';
import 'package:toridori_clone/screens/appbar_drawer/check_offer_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
        // bottom: TabBar(
        //   isScrollable: true,
        //   unselectedLabelColor: Colors.grey,
        //   indicatorColor: Colors.red.shade800,
        //   indicatorSize: TabBarIndicatorSize.label,
        //   indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
        //   labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        //   tabs: [
        //     Tab(child: Text('新着順')),
        //     Tab(child: Text('人気順')),
        //     Tab(child: Text('報酬順')),
        //     Tab(child: Text('本来の提供価格順')),
        //   ],
        // ),
      ),
      drawer: SafeArea(child: MainPageDrawer()),
      body: _tabBody(),
      // body: NestedScrollView(
      //   headerSliverBuilder: (context, value) {
      //     return [
      //       SliverAppBar(
      //         title: Text('Library'),
      //         bottom: PreferredSize(preferredSize: Size.fromHeight(48), child: _buildTabsRow()),
      //       ),
      //     ];
      //   },
      //   body: _tabBody(),
      // ),
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
        _buildTabActions() // 並び替えとフィルターのactions
      ],
    );
  }

  // タブの左寄せタイトル郡
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
          // child: TabBar(
          //   controller: _tabController,
          //   indicator: BoxDecoration(
          //     border: Border(
          //         bottom: BorderSide(
          //       width: 3,
          //       color: Colors.black,
          //     )),
          //   ),
          //   labelColor: Colors.white,
          //   unselectedLabelColor: Colors.grey,
          //   tabs: [
          //     _tabTitle('Car'),
          //     _tabTitle('Bike'),
          //     _tabTitle('Walk'),
          //   ],
          // ),
        ),
        Expanded(flex: 3, child: Container()),
      ],
    );
  }

  Widget _buildTabActions() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
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
    // return Container(
    //   // tab height
    //   height: 40,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       _tabAction(icon: const Icon(Icons.sort_outlined, color: Colors.white), onTap: () {}),
    //       _tabAction(icon: const Icon(Icons.filter_alt_outlined, color: Colors.white), onTap: () {}),
    //     ],
    //   ),
    // );
  }

  // Widget _tabAction({@required Icon? icon, @required Function? onTap}) {
  //   return Padding(
  //     padding: EdgeInsets.only(right: 20),
  //     child: GestureDetector(
  //       onTap: () => onTap,
  //       child: icon,
  //     ),
  //   );
  // }

  // Widget _tabTitle(String title) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 6),
  //     child: Container(
  //       height: 40,
  //       width: 132,
  //       child: Tab(text: title),
  //     ),
  //   );
  // }
}
