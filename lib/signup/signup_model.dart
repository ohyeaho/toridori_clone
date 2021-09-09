import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<dynamic> signup(
      {String? nickName, String? email, String? password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      print('アカウント作成成功');
      await users
          .add({
            'nickName': nickName,
            'createdAt': Timestamp.now(),
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'パスワードが弱すぎます';
      } else if (e.code == 'email-already-in-use') {
        return 'すでに使われているアカウントです';
      } else if (e.code == 'invalid-email') {
        return 'メールアドレスが無効です';
      } else {
        return 'エラーが発生しました';
      }
    } catch (e) {
      print(e);
      return e;
    }
  }
}
