import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toridori_clone/components/function_image.dart';

class UserFirestore {
  static final User currentUser = FirebaseAuth.instance.currentUser!;
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = _firestoreInstance.collection('users');

  /// 新規ユーザー作成メソッド
  static Future<dynamic> setUser({String? nickName, String? gender, String? birthday}) {
    return users
        .doc(currentUser.uid)
        .set({
          'nick_name': nickName,
          'name': '',
          'name_ruby': '',
          'gender': gender,
          'birthday': birthday,
          'image_path': '',
          'introduction': '',
          'area': '',
          'tag': '',
          'zipcode': '',
          'prefecture': '',
          'municipalities': '',
          'address': '',
          'address2': '',
          'tel': '',
          'payee': '',
          'bank_account_type': '',
          'bank_branch': '',
          'bank_number': '',
          'bank_holder': '',
          'created_time': Timestamp.now(),
          'updated_time': Timestamp.now(),
        })
        .then((value) => print("新規ユーザー作成完了"))
        .catchError((error) => print("新規ユーザー作成エラー: $error"));
    // try {
    //   await users.doc(currentUser!.uid).set({
    //     'nick_name': nickName,
    //     'name': '',
    //     'gender': gender,
    //     'birthday': birthday,
    //     'image_path': '',
    //     'introduction': '',
    //     'area': '',
    //     'tag': '',
    //     'created_time': Timestamp.now(),
    //     'updated_time': Timestamp.now(),
    //   });
    //   print('新規ユーザー作成完了');
    //   return true;
    // } on FirebaseException catch (e) {
    //   print('新規ユーザー作成エラー: $e');
    //   return false;
    // }
  }

  static Future<dynamic> setUserImage(String imagePath) async {
    try {
      await users.doc(currentUser.uid).set(
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

  ///プロフィール画像更新
  static Future updateUserImage(User user, image) async {
    final imageURL = await FunctionImage.uploadImage(image);
    return users
        .doc(user.uid)
        .update({
          'image_url': imageURL,
          'updated_time': Timestamp.now(),
        })
        .then((value) => print('プロフィール画像更新完了'))
        .catchError((e) => print('プロフィール画像更新エラー: $e'));
  }

  /// プロフィール画像の取得
  static Future getUserImage() async {
    DocumentSnapshot documentSnapshot = await users.doc(currentUser.uid).get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    if (documentSnapshot.exists) {
      var value = await data['image_url'];
      return value;
    } else {
      return null;
    }
  }

  /// ユーザ情報取得
  static Future getUser() async {
    DocumentSnapshot documentSnapshot = await users.doc(currentUser.uid).get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    if (documentSnapshot.exists) {
      var value = await data;
      return value;
    } else {
      return null;
    }
  }

  // static Future<dynamic> getUser() async {
  //   try {
  //     DocumentSnapshot documentSnapshot = await users.doc(currentUser.uid).get();
  //     Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
  //     Account myAccount = Account(
  //       id: currentUser.uid,
  //       nickName: data['nick_name'],
  //       gender: data['gender'],
  //       birthday: data['birthday'],
  //       imagePath: data['image_path'],
  //       name: data['name'],
  //       introduction: data['introduction'],
  //       area: data['area'],
  //       tag: data['tag'],
  //       createdTime: data['created_time'],
  //       updatedTime: data['updated_time'],
  //     );
  //     Authentication.myAccount = myAccount;
  //     print('ユーザー取得完了');
  //     return true;
  //   } on FirebaseException catch (e) {
  //     print('ユーザー取得エラー: $e');
  //     return false;
  //   }
  // }

  static Future<dynamic> updateProfile({String? nickName, String? area, String? introduction, String? tag}) async {
    try {
      await users.doc(currentUser.uid).update({
        'nick_name': nickName,
        'area': area,
        'introduction': introduction,
        'tag': tag,
        'updated_time': Timestamp.now(),
      });
      print('プロフィール更新完了');
      return true;
    } on FirebaseException catch (e) {
      print('プロフィール更新エラー: $e');
      return false;
    }
  }

  static Future<dynamic> updateNameBirthday({String? name, String? nameRuby, String? gender, String? birthday}) async {
    try {
      await users.doc(currentUser.uid).update({
        'name': name,
        'name_ruby': nameRuby,
        'gender': gender,
        'birthday': birthday,
        'updated_time': Timestamp.now(),
      });
      print('名前・生年月日更新完了');
      return true;
    } on FirebaseException catch (e) {
      print('名前・生年月日更新エラー: $e');
      return false;
    }
  }

  static Future<dynamic> updateAddressTel(
      {String? zipcode, String? prefecture, String? municipalities, String? address, String? otherAddress, String? tel}) async {
    try {
      await users.doc(currentUser.uid).update({
        'zipcode': zipcode,
        'prefecture': prefecture,
        'municipalities': municipalities,
        'address': address,
        'other_address': otherAddress,
        'tel': tel,
        'updated_time': Timestamp.now(),
      });
      print('住所・電話番号更新完了');
      return true;
    } on FirebaseException catch (e) {
      print('住所・電話番号更新エラー: $e');
      return false;
    }
  }

  static Future<dynamic> updatePayee({String? payee, String? bankAccountType, String? bankBranch, String? bankNumber, String? bankHolder}) async {
    try {
      await users.doc(currentUser.uid).update({
        'payee': payee,
        'bank_accountType': bankAccountType,
        'bank_branch': bankBranch,
        'bank_number': bankNumber,
        'bank_holder': bankHolder,
        'updated_time': Timestamp.now(),
      });
      print('銀行口座更新完了');
      return true;
    } on FirebaseException catch (e) {
      print('銀行口座更新エラー: $e');
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

  static Future<dynamic> deleteUser() async {
    users.doc(currentUser.uid).delete();
  }

  static Stream<DocumentSnapshot> snapshotsUid() => users.doc(currentUser.uid).snapshots();
}
