import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id;
  String nickName;
  String gender;
  String birthday;
  String name;
  String imagePath;
  String introduction;
  String area;
  String tag;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  Account({
    this.id = '',
    this.nickName = '',
    this.gender = '',
    this.birthday = '',
    this.name = '',
    this.imagePath = '',
    this.introduction = '',
    this.area = '',
    this.tag = '',
    this.createdTime,
    this.updatedTime,
  });
}
