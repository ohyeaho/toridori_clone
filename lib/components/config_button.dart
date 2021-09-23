import 'package:flutter/material.dart';

class ConfigButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;

  ConfigButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade800)),
        ),
        child: TextButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white,
                )
              ],
            ),
          ),
          onPressed: onPressed,
          style: TextButton.styleFrom(primary: Colors.white),
        ),
      ),
    );
  }
}
