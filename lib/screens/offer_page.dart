import 'package:flutter/material.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';
import 'package:toridori_clone/screens/appbar_drawer/check_offer_page.dart';

class OfferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'やり取りの管理',
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
          bottom: TabBar(
            indicatorColor: Colors.red.shade800,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 5,
            labelStyle: TextStyle(fontSize: 17),
            tabs: [
              Tab(text: '採用された'),
              Tab(text: '応募した'),
            ],
          ),
        ),
        drawer: SafeArea(child: MainPageDrawer()),
        body: TabBarView(
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown.shade300.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: Text('キャンペーンの応募が採用されると、以降のやり取りをここで行えるようになります'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(
                children: [
                  Flexible(
                    child: Text(
                        '応募したキャンペーンリストは下記画像のユーザーメニューに移動しました。近日中にこの画面の「応募した」は廃止されます。'),
                  ),
                  SizedBox(height: 40),
                  Image.asset('images/applied_campaign.jpg')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
