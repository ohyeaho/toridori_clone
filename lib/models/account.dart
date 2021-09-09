class Account {
  String nickName;
  String name;
  String imagePath;
  String introduction;
  String userId;
  DateTime? createdTime;
  DateTime? updatedTime;

  Account({
    this.nickName = '',
    this.name = '',
    this.imagePath = '',
    this.introduction = '',
    this.userId = '',
    this.createdTime,
    this.updatedTime,
  });
}
