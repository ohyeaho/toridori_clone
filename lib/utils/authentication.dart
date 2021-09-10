import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static User? currentFirebaseUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  /// サインアップメソッド
  static Future<dynamic> signup({String? nickName, String? email, String? password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      print('アカウント作成成功');
      // await users
      //     .add({
      //       'nickName': nickName,
      //       'createdAt': Timestamp.now(),
      //     })
      //     .then((value) => print("User Added"))
      //     .catchError((error) => print("Failed to add user: $error"));
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

  /// サインインメソッド
  Future<dynamic> signin({String? email, String? password}) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      currentFirebaseUser = result.user;
      print('ログイン成功');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'このメールアドレスのユーザーは見つかりませんでした';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'パスワードが間違っています';
      }
    }
  }
}
