import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toridori_clone/components/back_appbar.dart';
import 'package:toridori_clone/components/loading_widget.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/profile/profile_page_model.dart';
import 'package:toridori_clone/utils/firestore/users.dart';

class NameBirthdayPage extends StatefulWidget {
  const NameBirthdayPage({Key? key}) : super(key: key);

  @override
  _NameBirthdayPageState createState() => _NameBirthdayPageState();
}

class _NameBirthdayPageState extends State<NameBirthdayPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameRubyController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
    Future(() async {
      var userData = await UserFirestore.getUser();
      setState(() {});
      nameController = TextEditingController(text: userData['name']);
      nameRubyController = TextEditingController(text: userData['name_ruby']);
      genderController = TextEditingController(text: userData['gender']);
      birthdayController = TextEditingController(text: userData['birthday']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfilePageModel>(
      create: (_) => ProfilePageModel(),
      child: Stack(
        children: [
          Scaffold(
            appBar: BackAppbar.createAppBar('名前・生年月日を設定する'),
            body: Consumer<ProfilePageModel>(builder: (context, model, child) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),

                            /// 氏名
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '氏名',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: nameController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),

                            /// フリガナ
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'フリガナ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: nameRubyController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),

                            /// 性別
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '性別',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: genderController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),

                            /// 生年月日
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '生年月日',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: birthdayController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 150),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// 変更保存ボタン
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 80,
                      color: Colors.black,
                      child: Center(
                        child: Container(
                          width: 300,
                          child: TextButton(
                            onPressed: () async {
                              model.startLoading();
                              var result = await UserFirestore.updateNameBirthday(
                                name: nameController.text,
                                nameRuby: nameRubyController.text,
                                gender: genderController.text,
                                birthday: birthdayController.text,
                              );
                              if (result == true) {
                                // await ShowDialog.alertShowDialog(context, '変更を保存しました');
                                print('変更を保存しました');
                                model.endLoading();
                                Navigator.pop(context, true);
                              }
                            },
                            child: Text(
                              '変更を保存する',
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
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          Consumer<ProfilePageModel>(builder: (context, model, child) {
            return model.isLoading
                ? Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: LoadingWidget.circleLoading,
                    ),
                  )
                : SizedBox();
          }),
        ],
      ),
    );
  }
}
