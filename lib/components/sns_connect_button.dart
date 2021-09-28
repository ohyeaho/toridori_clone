import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnsConnectButton extends StatelessWidget {
  final String? text;
  final icon;
  final onPressed;

  SnsConnectButton({@required this.text, @required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade800)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  SizedBox(width: 25),
                  Text(
                    text!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // todo: 連携ボタン処理
                },
                style: TextButton.styleFrom(
                  primary: Colors.red.shade800,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                ),
                child: Text('連携する'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
