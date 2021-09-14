import 'package:flutter/material.dart';
import 'package:toridori_clone/components/back_appbar.dart';

class SnsConnectPage extends StatelessWidget {
  const SnsConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar.createAppBar('SNSを連携する'),
    );
  }
}
