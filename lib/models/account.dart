import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String nickName;
  String gender;
  String birthday;
  String name;
  String imagePath;
  String introduction;
  String userId;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  Account({
    this.nickName = '',
    this.gender = '',
    this.birthday = '',
    this.name = '',
    this.imagePath = '',
    this.introduction = '',
    this.userId = '',
    this.createdTime,
    this.updatedTime,
  });
}
