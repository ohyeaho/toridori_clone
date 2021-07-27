import 'package:flutter/material.dart';
import 'package:toridori_clone/components/back_appbar.dart';

class CheckOfferPage extends StatelessWidget {
  const CheckOfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(title: '対応が必要なオファー'),
    );
  }
}
