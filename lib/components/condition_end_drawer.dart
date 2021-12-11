import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:toridori_clone/screens/home/search/search_keyword_page.dart';

class ConditionEndDrawer extends StatelessWidget {
  final TextEditingController keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            ListView(
              physics: NeverScrollableScrollPhysics(), // listスクロール無効
              children: [
                Container(
                  height: 50,
                  child: DrawerHeader(
                    child: Text(
                      '条件を指定して探す',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // decoration: BoxDecoration(color: Colors.black),
                  ),
                ),
                ListTile(
                  title: Text(
                    '体験する場所',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'すべて',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    // todo: ボタン処理
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(color: Colors.grey),
                ),
                ListTile(
                  title: Text(
                    'ジャンル',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'すべて',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    // todo: ボタン処理
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(color: Colors.grey),
                ),
                ListTile(
                  title: Text(
                    'SNS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'すべて',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    // todo: ボタン処理
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(color: Colors.grey),
                ),
                ListTile(
                  title: Text(
                    '報酬がもらえるキャンペーンだけ表示する',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // todo: ボタン処理
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(color: Colors.grey),
                ),
                ListTile(
                  title: Text(
                    '応募できないキャンペーンを表示しない',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.help_outline,
                        color: Colors.white,
                      ),
                      SizedBox(width: 25),
                      Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onTap: () {
                    // todo: ボタン処理
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: keywordController,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 55,
                        width: 130,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'クリア',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            primary: Colors.white,
                            backgroundColor: Colors.red.shade100.withOpacity(0.3),
                            shape: StadiumBorder(),
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 130,
                        child: TextButton(
                          onPressed: () async {
                            // dynamic result = await Item.getItem(keywordController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SearchKeywordPage(keyword: keywordController.text)),
                            );
                            // Navigator.pop(context);
                          },
                          child: Text(
                            '探す',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            primary: Colors.white,
                            backgroundColor: Colors.red.shade800,
                            shape: StadiumBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
