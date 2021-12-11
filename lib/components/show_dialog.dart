import 'package:flutter/material.dart';

class ShowDialog {
  final bool doubleButtonOrNot;
  final String title;
  final String? content;
  final String buttonText;
  final Function() onPressed;
  final String doubleButtonText;
  final Function()? doubleButtonOnPressed;

  ShowDialog({
    required this.doubleButtonOrNot,
    required this.title,
    this.content,
    required this.buttonText,
    required this.onPressed,
    this.doubleButtonText = '',
    this.doubleButtonOnPressed,
  });

  Future alertShowDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          content: content != null ? Text(content!) : null,
          actions: [
            TextButton(
              child: Text(buttonText),
              onPressed: onPressed,
            ),
            if (doubleButtonOrNot)
              TextButton(
                child: Text(
                  doubleButtonText,
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: doubleButtonOnPressed,
              ),
          ],
        );
      },
    );
  }
}

// class ShowDialog {
//   static Future? alertShowDialog(
//     BuildContext context,
//     String? title,
//   ) async {
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             title!,
//             style: TextStyle(color: Colors.black),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
