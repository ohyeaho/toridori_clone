import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toridori_clone/components/loading_widget.dart';
import 'package:toridori_clone/components/main_page_appbar.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';
import 'package:toridori_clone/models/rakuten_api.dart';

class SearchKeywordPage extends StatelessWidget {
  String keyword = '';
  List<Item>? item;

  SearchKeywordPage({Key? key, required this.keyword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainPageAppbar(title: Text(keyword)),
        drawer: MainPageDrawer(),
        body: FutureBuilder(
          // future: Future.wait(Item.getItem('おすすめ')),
          future: Item.getItem(keyword),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              item = snapshot.data;
              return snapshot.data != null
                  ? ListView(
                      children: [
                        GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // grid数
                              crossAxisSpacing: 18, // grid間横スペース
                              mainAxisSpacing: 20, // grid間縦スペース
                              childAspectRatio: 0.65, // grid大きさ
                            ),
                            physics: NeverScrollableScrollPhysics(), // listスクロール無効
                            shrinkWrap: true, // list余白削除
                            itemCount: item!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Expanded(
                                    flex: 28,
                                    child: Image.network(
                                      '${item![index].image}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 13,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              '${item![index].name}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons.instagram,
                                                        color: Colors.purple,
                                                        size: 15,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '${item![index].price}人以上',
                                                        style: TextStyle(fontSize: 11),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons.favorite,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              );
                            }),
                      ],
                    )
                  : Center(child: LoadingWidget.circleLoading);
            } else {
              return Center(child: LoadingWidget.circleLoading);
            }
          },
        ),
      ),
    );
  }
}
