import 'dart:convert';

import 'package:http/http.dart';

class Item {
  String name;
  String image;
  String title;
  String caption;
  int? price;
  DateTime? time;

  Item({
    this.name = '',
    this.image = '',
    this.title = '',
    this.caption = '',
    this.price,
    this.time,
  });

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

  static Future<String?> getItem(String keyword) async {
    var _keyword = Uri.encodeComponent(keyword);
    String url =
        'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?keyword=$_keyword&format=json&applicationId=1018749470638496278';
    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      String image = data['Items'][0]['Item']
          ['itemName'] /*['mediumImageUrls'][0]['imageUrl']*/;
      return image;
    } catch (e) {
      print('エラー: $e');
      return null;
    }
  }
}

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
