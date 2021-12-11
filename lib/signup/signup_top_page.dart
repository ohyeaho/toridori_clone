import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toridori_clone/signup/login_page.dart';
import 'package:toridori_clone/signup/signup_page.dart';

class SignupTopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: FittedBox(
                        child: Text(
                          'インフルエンサーと企業がつながるサービス',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child:
                                Image.asset('images/toridori_signup_icon.jpg'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            child: Text(
                              'toridori',
                              style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'base',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: Row(
                      children: [
                        // todo: チェックボタン
                        Text('□'),
                        SizedBox(width: 10),
                        // todo: 下線TextButton
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '利用規約',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // todo: 利用規約表示処理
                                    print('利用規約');
                                  },
                              ),
                              TextSpan(text: 'と'),
                              TextSpan(
                                text: 'プライバシーポリシー',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // todo: プライバシーポリシー表示処理
                                    print('プライバシーポリシー');
                                  },
                              ),
                              TextSpan(text: 'に同意します'),
                            ],
                          ),
                        ),
                        // Text('利用規約とプライバシーポリシーに同意します'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                      child: Text(
                        'メールアドレスで登録・ログイン',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(primary: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'LINEを持っていいない方はこちら',
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          // todo: ボタン処理
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.apple),
                            SizedBox(width: 5),
                            Text(
                              'Sign in with Apple',
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(primary: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
