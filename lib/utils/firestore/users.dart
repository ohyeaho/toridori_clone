import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toridori_clone/models/account.dart';
import 'package:toridori_clone/utils/authentication.dart';

class UserFirestore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = _firestoreInstance.collection('users');

  static Future<dynamic> setUser({String? nickName, String? gender, String? birthday}) async {
    try {
      await users.doc(Authentication.currentFirebaseUser!.uid).set({
        'nick_name': nickName,
        'name': '',
        'gender': gender,
        'birthday': birthday,
        'image_path': '',
        'introduction': '',
        'area': '',
        'tag': '',
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

  static Future<dynamic> getUser(String uid) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      Account myAccount = Account(
        id: uid,
        nickName: data['nick_name'],
        gender: data['gender'],
        birthday: data['birthday'],
        imagePath: data['image_path'],
        name: data['name'],
        introduction: data['introduction'],
        area: data['area'],
        tag: data['tag'],
        createdTime: data['created_time'],
        updatedTime: data['updated_time'],
      );
      Authentication.myAccount = myAccount;
      print('ユーザー取得完了');
      // print(myAccount.nickName);
      return true;
    } on FirebaseException catch (e) {
      print('ユーザー取得エラー: $e');
      return false;
    }
  }

  static Future<dynamic> updateProfile(Account updateAccount) async {
    try {
      await users.doc(Authentication.currentFirebaseUser!.uid).update({
        'image_path': updateAccount.imagePath,
        'nick_name': updateAccount.nickName,
        'area': updateAccount.area,
        'introduction': updateAccount.introduction,
        'tag': updateAccount.tag,
        'updated_time': Timestamp.now(),
      });
      print('プロフィール更新完了');
      return true;
    } on FirebaseException catch (e) {
      print('プロフィール更新エラー: $e');
      return false;
    }
  }

  // static Future<dynamic> updateProfile({String? imagePath, String? nickName, String? area, String? introduction, String? tag}) async {
  //   try {
  //     await users.doc(Authentication.currentFirebaseUser!.uid).update({
  //       'image_path': imagePath,
  //       'nick_name': nickName,
  //       'area': area,
  //       'introduction': introduction,
  //       'tag': tag,
  //       'updated_time': Timestamp.now(),
  //     });
  //     print('プロフィール更新完了');
  //     return true;
  //   } on FirebaseException catch (e) {
  //     print('プロフィール更新エラー: $e');
  //     return false;
  //   }
  // }
}
