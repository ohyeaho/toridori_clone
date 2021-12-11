import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:toridori_clone/components/show_dialog.dart';
import 'package:toridori_clone/main_page.dart';
import 'package:toridori_clone/utils/authentication.dart';
import 'package:toridori_clone/utils/firestore/users.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
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
            'アカウントを作成する',
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
                        /// インフルエンサー名
                        Container(
                          color: Colors.red.withOpacity(0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'インフルエンサー名',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: nickNameController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) return '入力してください';
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

                        /// 性別
                        Container(
                          color: Colors.red.withOpacity(0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '性別',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: genderController,
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

                        /// 生年月日
                        Container(
                          color: Colors.red.withOpacity(0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '生年月日',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: birthdayController,
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

              /// アカウント作成ボタン
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
                          dynamic result = await context.read<Authentication>().signUp(
                                nickName: nickNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          if (result == true) {
                            FirebaseAuth.instance.authStateChanges().listen((User? user) async {
                              if (user != null) {
                                UserFirestore.setUser(
                                  nickName: nickNameController.text,
                                  gender: genderController.text,
                                  birthday: birthdayController.text,
                                );
                                await ShowDialog(
                                  doubleButtonOrNot: false,
                                  title: '登録完了しました',
                                  buttonText: '完了',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ).alertShowDialog(context);
                                // await ShowDialog.alertShowDialog(context, '登録完了しました');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(),
                                  ),
                                );
                              }
                            });
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
                        }
                      },
                      child: Text(
                        'アカウントを作成する',
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
