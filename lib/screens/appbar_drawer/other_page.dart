import 'package:flutter/material.dart';
import 'package:toridori_clone/components/back_appbar.dart';
import 'package:toridori_clone/components/config_button.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/address_tel/address_tel_page.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/name_birthday/name_birthday_page.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/payee/payee_page.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/profile/profile_page.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar.createAppBar('その他'),
      body: ListView(
        children: [
          ConfigButton(
            text: '通知設定',
            // todo: ボタン処理
            onPressed: ProfilePage(),
          ),
          ConfigButton(
            text: 'お問い合わせ',
            // todo: ボタン処理
            onPressed: NameBirthdayPage(),
          ),
          ConfigButton(
            text: 'アプリへの要望',
            // todo: ボタン処理
            onPressed: AddressTelPage(),
          ),
          ConfigButton(
            text: '利用規約',
            // todo: ボタン処理
            onPressed: PayeePage(),
          ),
          ConfigButton(
            text: 'プライバシーポリシー',
            // todo: ボタン処理
            onPressed: PayeePage(),
          ),
        ],
      ),
    );
  }
}
