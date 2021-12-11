import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:toridori_clone/components/show_dialog.dart';
import 'package:toridori_clone/main_page.dart';
import 'package:toridori_clone/utils/authentication.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'ログイン',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),

                        /// メールアドレス
                        Container(
                          color: Colors.red.withOpacity(0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'メールアドレス',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) return '入力してください';
                                  // if (EmailValidator.validate(value)) return 'メールアドレスが正しくありません';
                                },
                                cursorColor: Colors.red,
                                style: TextStyle(color: Colors.grey.shade400),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),

                        /// パスワード
                        Container(
                          color: Colors.red.withOpacity(0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'パスワード',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) return '入力してください';
                                },
                                obscureText: true,
                                cursorColor: Colors.red,
                                style: TextStyle(color: Colors.grey.shade400),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 150),
                      ],
                    ),
                  ],
                ),
              ),

              /// ログインボタン
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          dynamic result = await context.read<Authentication>().signIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                          await FirebaseAuth.instance.authStateChanges().listen(
                            (User? user) {
                              if (user != null) {
                                // ShowDialog.alertShowDialog(context, 'ログイン');
                                ShowDialog(
                                  doubleButtonOrNot: false,
                                  title: 'ログイン',
                                  buttonText: '完了',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ).alertShowDialog(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(),
                                  ),
                                );
                              } else {
                                ShowDialog(
                                  doubleButtonOrNot: false,
                                  title: result.toString(),
                                  buttonText: '戻る',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ).alertShowDialog(context);
                                // ShowDialog.alertShowDialog(context, result.toString());
                              }
                            },
                          );
                        }
                        // if (formKey.currentState!.validate()) {
                        //   dynamic result = await context.read<Authentication>().signIn(
                        //         email: emailController.text,
                        //         password: passwordController.text,
                        //       );
                        //   FirebaseAuth.instance.authStateChanges().listen(
                        //     (User? user) async {
                        //       if (user != null) {
                        //         var _result = await UserFirestore.getUser(UserFirestore.currentUser!.uid);
                        //         if (_result == true) {
                        //           ShowDialog.alertShowDialog(context, 'ログイン');
                        //           Navigator.pushReplacement(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) => MainPage(),
                        //             ),
                        //           );
                        //         } else {
                        //           ShowDialog.alertShowDialog(context, result.toString());
                        //         }
                        //       }
                        //     },
                        //   );
                        //   // if (result is UserCredential) {
                        //   //   var _result = await UserFirestore.getUser(result.user!.uid);
                        //   //   if (_result == true) {
                        //   //     ShowDialog.alertShowDialog(context, 'ログイン');
                        //   //     Navigator.pushReplacement(
                        //   //       context,
                        //   //       MaterialPageRoute(
                        //   //         builder: (context) => MainPage(),
                        //   //       ),
                        //   //     );
                        //   //   }
                        //   // } else {
                        //   //   ShowDialog.alertShowDialog(context, result.toString());
                        //   // }
                        // }
                      },
                      child: Text(
                        'ログイン',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      style: TextButton.styleFrom(primary: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
