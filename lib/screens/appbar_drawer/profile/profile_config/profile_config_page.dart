import 'package:flutter/material.dart';
import 'package:toridori_clone/components/back_appbar.dart';
import 'package:toridori_clone/components/config_button.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/name_birthday/name_birthday_page.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/profile/profile_page.dart';

class ProfileConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar.createAppBar('設定'),
      body: ListView(
        children: [
          ConfigButton(
            text: 'プロフィール情報',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ConfigButton(
            text: '名前・生年月日',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NameBirthdayPage()),
              );
            },
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
