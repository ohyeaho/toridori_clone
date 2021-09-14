import 'package:firebase_auth/firebase_auth.dart';
import 'package:toridori_clone/models/account.dart';

class Authentication {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
  static Account? myAccount;

  /// サインアップメソッド
  static Future<dynamic> signUp({String? nickName, String? email, String? password}) async {
    try {
      UserCredential _result = await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      print('アカウント作成成功');
      return _result;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'パスワードが弱すぎます';
      } else if (e.code == 'email-already-in-use') {
        return 'このメールアドレスはすでに使われています';
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
  static Future<dynamic> signIn({String? email, String? password}) async {
    try {
      final UserCredential _result = await auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      currentFirebaseUser = _result.user;
      print('ログイン成功');
      return _result;
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
