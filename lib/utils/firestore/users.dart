import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toridori_clone/models/account.dart';
import 'package:toridori_clone/utils/authentication.dart';

class UserFirestore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = _firestoreInstance.collection('users');

  static Future<dynamic> setUser(Account newAccount) async {
    try {
      await users.doc(Authentication.currentFirebaseUser!.uid).set({
        'nick_name': newAccount.nickName,
        'gender': newAccount.gender,
        'birthday': newAccount.birthday,
        'user_id': newAccount.userId,
        'created_time': Timestamp.now(),
        'updated_time': Timestamp.now(),
      });
      print('新規ユーザー作成完了');
      return true;
    } on FirebaseException catch (e) {
      print('新規ユーザー作成エラー: $e');
      return false;
    }
  }

  static Future<dynamic> setUserImage(String imagePath) async {
    try {
      await users.doc(Authentication.currentFirebaseUser!.uid).set(
        {
          'image_path': imagePath,
          'created_time': Timestamp.now(),
          'updated_time': Timestamp.now(),
        },
        SetOptions(merge: true),
      );
      print('ユーザー画像登録完了');
      return true;
    } on FirebaseException catch (e) {
      print('ユーザー画像登録エラー: $e');
      return false;
    }
  }
}
