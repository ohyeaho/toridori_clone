import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:toridori_clone/screens/appbar_drawer/other_page.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/profile_config_page.dart';
import 'package:toridori_clone/screens/appbar_drawer/sns_connect_page.dart';
import 'package:toridori_clone/signup/signup_top_page.dart';
import 'package:toridori_clone/utils/authentication.dart';
import 'package:toridori_clone/utils/firestore/users.dart';

class MainPageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<DocumentSnapshot>(
                        stream: UserFirestore.snapshotsUid(),
                        builder: (context, snapshot) {
                          return FutureBuilder(
                            future: UserFirestore.getUser(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return CircleAvatar(
                                  radius: 50,
                                  foregroundImage: snapshot.data['image_url'] !=
                                          null
                                      ? NetworkImage(snapshot.data['image_url'])
                                      : null,
                                  child: Image.asset('images/profile_icon.jpg'),
                                );
                              } else {
                                return CircleAvatar(
                                  radius: 50,
                                  child: Image.asset('images/profile_icon.jpg'),
                                );
                              }
                            },
                          );
                        }),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SnsConnectPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '???????????????????????????00%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),

                /// ??????????????????????????????
                /// todo: ?????????
                SizedBox(
                  width: 200,
                  child: Divider(
                    thickness: 5,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 50),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      '????????????????????????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(-16, 0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileConfigPage()),
                    );
                  },
                  // todo: ????????? ???????????????????????????
                  // trailing: Icon(
                  //   Icons.circle,
                  //   color: Colors.red,
                  // ),
                ),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      'SNS?????????????????????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(-16, 0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SnsConnectPage()),
                    );
                  },
                ),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      'Facebook??????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(10, 0),
                  ),
                  onTap: () {
                    //todo: ???????????????
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignupTopPage()),
                    // );
                  },
                ),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      '??????????????????????????????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(-16, 0),
                  ),
                  onTap: () {
                    //todo: ???????????????
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SnsConnect()),
                    // );
                  },
                ),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      '???????????????????????????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(-16, 0),
                  ),
                  onTap: () {
                    //todo: ???????????????
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SnsConnect()),
                    // );
                  },
                ),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      '????????????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(-16, 0),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext dialogContext) {
                        return CupertinoAlertDialog(
                          title: Text('??????????????????????????????'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('???????????????'),
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                '???????????????',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () async {
                                context.read<Authentication>().signOut();
                                FirebaseAuth.instance
                                    .authStateChanges()
                                    .listen((User? user) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new SignupTopPage()),
                                      (_) => false);
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );
                    //todo: ???????????????
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SnsConnect()),
                    // );
                  },
                ),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      'FAQ (??????LINE)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(-16, 0),
                  ),
                  onTap: () {
                    //todo: ???????????????
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SnsConnect()),
                    // );
                  },
                ),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      '?????????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(-16, 0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtherPage()),
                    );
                  },
                ),
                ListTile(
                  title: Transform.translate(
                    child: Text(
                      '??????????????????ID????????????',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    offset: Offset(-16, 0),
                  ),
                  onTap: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext dialogContext) {
                        return CupertinoAlertDialog(
                          title: Text('????????????????????????????????????'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('???????????????'),
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                '??????',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () async {
                                // ????????????
                                try {
                                  context.read<Authentication>();
                                  await UserFirestore.deleteUser();
                                  await Authentication.deleteAuth();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new SignupTopPage()),
                                      (_) => false);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'requires-recent-login') {
                                    print(
                                        'The user must reauthenticate before this operation can be executed.');
                                  }
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                    //todo: ???????????????
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SnsConnect()),
                    // );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
