import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ConditionEndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            ListView(
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
                          onPressed: () {},
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
      // child: Container(
      //   color: Colors.black,
      //   child: ListView(
      //     children: [
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               StreamBuilder<DocumentSnapshot>(
      //                   stream: UserFirestore.snapshotsUid(),
      //                   builder: (context, snapshot) {
      //                     return FutureBuilder(
      //                       future: UserFirestore.getUser(),
      //                       builder: (BuildContext context, AsyncSnapshot snapshot) {
      //                         if (snapshot.connectionState == ConnectionState.done) {
      //                           return CircleAvatar(
      //                             radius: 50,
      //                             foregroundImage: snapshot.data['image_url'] != null
      //                                 ? NetworkImage(snapshot.data['image_url'])
      //                                 : null,
      //                             child: Image.asset('images/profile_icon.jpg'),
      //                           );
      //                         } else {
      //                           return CircleAvatar(
      //                             radius: 50,
      //                             child: Image.asset('images/profile_icon.jpg'),
      //                           );
      //                         }
      //                       },
      //                     );
      //                   }),
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(builder: (context) => SnsConnectPage()),
      //                   );
      //                 },
      //                 child: Row(
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.all(4.0),
      //                       child: Icon(
      //                         FontAwesomeIcons.instagram,
      //                         color: Colors.grey,
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(4.0),
      //                       child: Icon(
      //                         FontAwesomeIcons.twitter,
      //                         color: Colors.grey,
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(4.0),
      //                       child: Icon(
      //                         FontAwesomeIcons.youtube,
      //                         color: Colors.grey,
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //           SizedBox(height: 15),
      //           Text(
      //             'name',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(height: 10),
      //           Text(
      //             'プロフィール充実度00%',
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.grey,
      //             ),
      //           ),
      //           SizedBox(height: 5),
      //
      //           /// プロフィール充実度線
      //           /// todo: 未完成
      //           SizedBox(
      //             width: 200,
      //             child: Divider(
      //               thickness: 5,
      //               color: Colors.red,
      //             ),
      //           ),
      //           SizedBox(height: 50),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 'プロフィール設定',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(-16, 0),
      //             ),
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => ProfileConfigPage()),
      //               );
      //             },
      //             // todo: 未完成 やることマーク対応
      //             // trailing: Icon(
      //             //   Icons.circle,
      //             //   color: Colors.red,
      //             // ),
      //           ),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 'SNSアカウント連携',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(-16, 0),
      //             ),
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => SnsConnectPage()),
      //               );
      //             },
      //           ),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 'Facebook認証',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(10, 0),
      //             ),
      //             onTap: () {
      //               //todo: ボタン処理
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => SignupTopPage()),
      //               );
      //             },
      //           ),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 '応募したキャンペーン',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(-16, 0),
      //             ),
      //             onTap: () {
      //               //todo: ボタン処理
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(builder: (context) => SnsConnect()),
      //               // );
      //             },
      //           ),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 '振り込み予定の確認',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(-16, 0),
      //             ),
      //             onTap: () {
      //               //todo: ボタン処理
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(builder: (context) => SnsConnect()),
      //               // );
      //             },
      //           ),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 'お知らせ',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(-16, 0),
      //             ),
      //             onTap: () {
      //               showDialog(
      //                 context: context,
      //                 barrierDismissible: true,
      //                 builder: (BuildContext dialogContext) {
      //                   return CupertinoAlertDialog(
      //                     title: Text('ログアウトしますか？'),
      //                     actions: <Widget>[
      //                       TextButton(
      //                         child: Text('キャンセル'),
      //                         onPressed: () {
      //                           Navigator.of(dialogContext).pop();
      //                         },
      //                       ),
      //                       TextButton(
      //                         child: Text(
      //                           'ログアウト',
      //                           style: TextStyle(color: Colors.red),
      //                         ),
      //                         onPressed: () async {
      //                           context.read<Authentication>().signOut();
      //                           FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //                             Navigator.pushAndRemoveUntil(context,
      //                                 new MaterialPageRoute(builder: (context) => new SignupTopPage()), (_) => false);
      //                           });
      //                         },
      //                       ),
      //                     ],
      //                   );
      //                 },
      //               );
      //               //todo: ボタン処理
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(builder: (context) => SnsConnect()),
      //               // );
      //             },
      //           ),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 'FAQ (公式LINE)',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(-16, 0),
      //             ),
      //             onTap: () {
      //               //todo: ボタン処理
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(builder: (context) => SnsConnect()),
      //               // );
      //             },
      //           ),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 'その他',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(-16, 0),
      //             ),
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => OtherPage()),
      //               );
      //             },
      //           ),
      //           ListTile(
      //             title: Transform.translate(
      //               child: Text(
      //                 'フォーム入力IDはこちら',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               offset: Offset(-16, 0),
      //             ),
      //             onTap: () async {
      //               showDialog(
      //                 context: context,
      //                 barrierDismissible: true,
      //                 builder: (BuildContext dialogContext) {
      //                   return CupertinoAlertDialog(
      //                     title: Text('アカウント削除しますか？'),
      //                     actions: <Widget>[
      //                       TextButton(
      //                         child: Text('キャンセル'),
      //                         onPressed: () {
      //                           Navigator.of(dialogContext).pop();
      //                         },
      //                       ),
      //                       TextButton(
      //                         child: Text(
      //                           '削除',
      //                           style: TextStyle(color: Colors.red),
      //                         ),
      //                         onPressed: () async {
      //                           // 削除処理
      //                           try {
      //                             context.read<Authentication>();
      //                             await UserFirestore.deleteUser();
      //                             await Authentication.deleteAuth();
      //                             Navigator.pushAndRemoveUntil(context,
      //                                 new MaterialPageRoute(builder: (context) => new SignupTopPage()), (_) => false);
      //                           } on FirebaseAuthException catch (e) {
      //                             if (e.code == 'requires-recent-login') {
      //                               print('The user must reauthenticate before this operation can be executed.');
      //                             }
      //                           }
      //                         },
      //                       ),
      //                     ],
      //                   );
      //                 },
      //               );
      //               //todo: ボタン処理
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(builder: (context) => SnsConnect()),
      //               // );
      //             },
      //           )
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
