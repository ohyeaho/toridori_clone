import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toridori_clone/components/back_appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
// class ProfilePage extends StatelessWidget {
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController profileController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(title: 'プロフィールを設定する'),
      body: Stack(
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
                        CircleAvatar(
                          foregroundImage: image == null ? null : FileImage(image!),
                          radius: 40,
                          child: Image.asset('images/profile_icon.jpg'),
                        ),
                        TextButton(
                          onPressed: () {
                            getImageFromGallery();
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
                            controller: profileController,
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
                    onPressed: () {},
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
      ),
    );
  }
}
