import 'dart:convert';

import 'package:http/http.dart';

class Item {
  String name; // 商品の名前
  String image; // 商品画像
  String caption; // 商品の説明
  int? price; // 商品の値段
  DateTime? time;

  Item({
    this.name = '',
    this.image = '',
    this.caption = '',
    this.price,
    this.time,
  });

  // item info test
  static Future<List<Item>?> getItem(String keyword) async {
    var _keyword = Uri.encodeComponent(keyword); // utf-8にエンコード
    var applicationId = 1018749470638496278;
    // print(_keyword);
    String url =
        'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?&format=json&applicationId=$applicationId&keyword=$_keyword';
    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      List<dynamic> itemData = data['Items'];
      print(data['Items']);
      List<Item> items = itemData.map((item) {
        return Item(
          name: item['Item']['itemName'],
          image: item['Item']['mediumImageUrls'][0]['imageUrl'],
          price: item['Item']['itemPrice'],
        );
      }).toList();
      return items;
    } catch (e) {
      print('エラー: $e');
      return null;
    }
  }
}
