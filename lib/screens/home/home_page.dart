import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toridori_clone/components/loading_widget.dart';
import 'package:toridori_clone/components/main_page_appbar.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';
import 'package:toridori_clone/models/category.dart';
import 'package:toridori_clone/models/rakuten_api.dart';
import 'package:toridori_clone/screens/home/campaign_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> category = [
    Category(name: 'グルメ', image: 'images/home_top_gourmet.jpg'),
    Category(name: 'トラベル', image: 'images/home_top_travel.jpg'),
    Category(name: 'レジャー', image: 'images/home_top_leisure.jpg'),
    Category(name: 'アパレル', image: 'images/home_top_apparel.jpg'),
    Category(name: 'ビューティー', image: 'images/home_top_beauty.jpg'),
    Category(name: 'その他', image: 'images/home_top_other.jpg'),
  ];
  List<String> sort = ['すべて', '報酬がもらえる', '同伴者も無料', '自宅でできる'];
  List<Item>? item;

  /// rakuten api 取得
  @override
  void initState() {
    super.initState();
    Future(() async {
      item = await Item.getItem('おすすめ');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPageAppbar(
        title: SizedBox(
          width: 200,
          child: Image.asset('images/toridori_icon.jpg'),
        ),
      ),
      drawer: SafeArea(child: MainPageDrawer()),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              /// 横並びのカテゴリ
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: category.map((category) {
                    return Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CampaignListPage()),
                              );
                            },
                            child: Image.asset('${category.image}'),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),

              /// ソートタブ
              Text(
                'おすすめのキャンペーン',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: sort.map((sortSelect) {
                    return Row(
                      children: [
                        Container(
                          height: 23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red.shade800,
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              minimumSize: Size(0, 0),
                            ),
                            onPressed: () {
                              // todo: ボタン処理
                            },
                            child: Text(
                              '$sortSelect',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),

              /// 商品リスト
              item != null

                  /// 商品がapiから取得できとき
                  ? GridView.builder(
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
                      })

                  /// 商品情報をapiから取得するまだのロードのクルクル
                  : Center(child: LoadingWidget().circleLoading),
              SizedBox(height: 20)
            ],
          );
        },
      ),
    );
  }
}
