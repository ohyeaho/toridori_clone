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
  static Future<Item?> getItem(String keyword) async {
    var _keyword = Uri.encodeComponent(keyword); // utf-8にエンコード
    var applicationId = 1018749470638496278;
    // print(_keyword);
    String url =
        'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?&format=json&applicationId=$applicationId&keyword=$_keyword';
    // var result = await get(Uri.parse(url));
    // Map<String, dynamic> data = jsonDecode(result.body);
    // Item items = Item(
    //   name: data['Items'][0]['Item']['itemName'],
    //   image: data['Items'][0]['Item']['mediumImageUrls'][0]['imageUrl'],
    //   price: data['Items'][0]['Item']['itemPrice'],
    // );
    // return items;
    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      Item items = Item(
        name: data['Items'][0]['Item']['itemName'],
        image: data['Items'][0]['Item']['mediumImageUrls'][0]['imageUrl'],
        price: data['Items'][0]['Item']['itemPrice'],
      );
      return items;
    } catch (e) {
      print('エラー: $e');
      return null;
    }
  }
}

// get api test
//   static Future<Map<String, String>?> getItem(String keyword) async {
//     var _keyword = Uri.encodeComponent(keyword); // utf-8にエンコード
//     var applicationId = 1018749470638496278;
//     String url =
//         'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?&format=json&applicationId=$applicationId&keyword=$_keyword';
//     try {
//       var result = await get(Uri.parse(url));
//       Map<String, dynamic> data = jsonDecode(result.body);
//       Map<String, String>? response = {};
//       if (data['Items'] != null) {
//         response['Items'] = data['Items'][0]['Item']['itemName'];
//       } else {
//         response['message'] = '正しい検索キーワードを指定してください';
//       }
//       return response;
//     } catch (e) {
//       print('エラー: $e');
//       return null;
//     }
//   }
// }

// static Future<Map<String, List<Item>>?> getItem(String keyword) async {
//   var _keyword = Uri.encodeComponent(keyword);
//   Map<String, List<Item>>? response = {};
//   String url =
//       'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?keyword=$_keyword&format=json&applicationId=1018749470638496278';
//   try {
//     var result = await get(Uri.parse(url));
//     Map<String, dynamic> data = jsonDecode(result.body);
//     List<dynamic> itemData = data['Items'];
//     List<Item> items = itemData.map((item) {
//       return Item(
//         name: item['Item']['itemName'],
//       );
//     }).toList();
//     response['Items'] = items;
//     return response;
//   } catch (e) {
//     print('エラー: $e');
//     return null;
//   }
// }

// class ItemService{
//   static const _uri =
//       'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?applicationId=&keyword=';
//
//   HttpClient _httpClient;
//   String _searchWord;
//
//   Map<String, String> queryParameters;
//
//   ItemService(String searchWord) {
//     _httpClient = new HttpClient();
//     _searchWord = searchWord;
//   }
//
//   Future<List<String>> getItems({Map<String, String>? queryParameters}) async {
//     try {
//       String _url = _uri + Uri.encodeQueryComponent(_searchWord);
//
//       HttpClientRequest request = await _httpClient.getUrl(Uri.parse(_url));
//       HttpClientResponse response = await request.close();
//       StringBuffer buffer = new StringBuffer();
//       await for (String a in response.transform(utf8.decoder)) {
//         buffer.write(a);
//       }
//       var items = jsonDecode(buffer.toString());
//       List<String> result = [];
//
//       List hoge = items['Items'];
//       hoge.forEach((element) => print(element['Item']['itemName']));
//       hoge.forEach((element) => result.add(element['Item']['itemName'].toString()));
//
//       return result;
//
//     } catch (e) {
//       throw _handleError(e);
//     }
//   }
//
//   Exception _handleError(dynamic e) {
//     print(e);
//     return new Exception('Server error; cause: $e');
//   }
// }
