import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toridori_clone/components/back_appbar.dart';
import 'package:toridori_clone/components/sns_connect_button.dart';

class SnsConnectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar.createAppBar('SNSを連携する'),
      body: Column(
        children: [
          SnsConnectButton(
            text: 'Instagram',
            icon: Icon(
              FontAwesomeIcons.instagram,
              color: Colors.purple,
            ),
            onPressed: SnsConnectPage(),
          ),
          SnsConnectButton(
            text: 'Twitter',
            icon: Icon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
            ),
            onPressed: SnsConnectPage(),
          ),
          SnsConnectButton(
            text: 'YouTube',
            icon: Icon(
              FontAwesomeIcons.youtube,
              color: Colors.red,
            ),
            onPressed: SnsConnectPage(),
          ),
        ],
      ),
    );
  }
}
