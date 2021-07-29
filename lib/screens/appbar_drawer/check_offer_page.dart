import 'package:flutter/material.dart';
import 'package:toridori_clone/components/back_appbar.dart';

class CheckOfferPage extends StatelessWidget {
  const CheckOfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(title: '対応が必要なオファー'),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lime.shade800.withOpacity(0.6),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
                Text('対応が必要なオファーはありません'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
