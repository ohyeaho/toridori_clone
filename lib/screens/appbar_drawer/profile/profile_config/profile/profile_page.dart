import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toridori_clone/components/back_appbar.dart';
import 'package:toridori_clone/components/function_image.dart';
import 'package:toridori_clone/components/loading_widget.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/profile/profile_page_model.dart';
import 'package:toridori_clone/utils/firestore/users.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nickNameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController introductionController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
    Future(() async {
      var userData = await UserFirestore.getUser();
      setState(() {});
      nickNameController = TextEditingController(text: userData['nick_name']);
      areaController = TextEditingController(text: userData['area']);
      introductionController = TextEditingController(text: userData['introduction']);
      tagController = TextEditingController(text: userData['tag']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel(),
      child: Stack(
        children: [
          Scaffold(
            appBar: BackAppbar.createAppBar('プロフィールを設定する'),
            body: Consumer<ProfileModel>(builder: (context, model, child) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'プロフィール画像',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// プロフィール画像表示
                                FutureBuilder(
                                  future: UserFirestore.getUser(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      return CircleAvatar(
                                        radius: 40,
                                        foregroundImage: model.image != null
                                            ? FileImage(model.image!)
                                            : snapshot.data['image_url'] != null
                                                ? NetworkImage(snapshot.data['image_url']) as ImageProvider
                                                : null,
                                        child: Image.asset('images/profile_icon.jpg'),
                                      );
                                    } else {
                                      return CircleAvatar(
                                        radius: 40,
                                        child: Image.asset('images/profile_icon.jpg'),
                                      );
                                    }
                                  },
                                ),

                                /// 画像変更ボタン
                                TextButton(
                                  onPressed: () async {
                                    var result = await FunctionImage.getImageFromGallery();
                                    if (result != null) {
                                      image = await model.setImage(File(result.path));
                                    }
                                  },
                                  child: Text(
                                    '変更する',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                                    primary: Colors.white,
                                    backgroundColor: Colors.red.shade800,
                                    shape: StadiumBorder(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),

                            /// ニックネーム
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'ニックネーム',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: nickNameController,
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

                            /// 主な活動エリア
                            // todo: 選択型
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '主な活動エリア',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: areaController,
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

                            /// プロフィール文
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'プロフィール文',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: introductionController,
                                    cursorColor: Colors.red,
                                    maxLength: 200,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      counterStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
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
                            SizedBox(height: 10),
                            Text(
                              '興味関心、好きなことや、SNSを使う上で心がけていることなど、あなたのことをできる限り教えて下さい',
                              style: TextStyle(color: Colors.grey.shade300),
                            ),
                            SizedBox(height: 40),

                            /// マイタグ
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'マイタグ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: tagController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      hintText: 'ファッション',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
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
                            SizedBox(height: 10),
                            Text(
                              'あなたを表すハッシュタグを自由に設定してください',
                              style: TextStyle(color: Colors.grey.shade300),
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
                              if (image != null) await UserFirestore.updateUserImage(image);
                              var result = await UserFirestore.updateProfile(
                                nickName: nickNameController.text,
                                area: areaController.text,
                                introduction: introductionController.text,
                                tag: tagController.text,
                              );
                              if (result == true) {
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
          Consumer<ProfileModel>(builder: (context, model, child) {
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
