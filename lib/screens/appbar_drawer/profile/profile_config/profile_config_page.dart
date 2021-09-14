import 'package:flutter/material.dart';
import 'package:toridori_clone/components/back_appbar.dart';
import 'package:toridori_clone/components/config_button.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/profile/profile_page.dart';
import 'package:toridori_clone/utils/authentication.dart';

class ProfileConfigPage extends StatefulWidget {
  const ProfileConfigPage({Key? key}) : super(key: key);

  @override
  _ProfileConfigPageState createState() => _ProfileConfigPageState();
}

class _ProfileConfigPageState extends State<ProfileConfigPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
// class ProfileConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar.createAppBar('設定'),
      body: ListView(
        children: [
          ConfigButton(
            text: 'プロフィール情報',
            onPressed: () {
              var result = Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              if (result == true) {
                setState(() {
                  Authentication.myAccount!;
                });
              }
            },
          ),
          ConfigButton(
            text: '名前・生年月日',
            onPressed: () {},
          ),
          ConfigButton(
            text: '住所・電話番号',
            onPressed: () {},
          ),
          ConfigButton(
            text: '振込先',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
