import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:toridori_clone/components/main_page_appbar.dart';
import 'package:toridori_clone/components/main_page_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPageAppbar(
        title: SizedBox(
          width: 200,
          child: Image.asset('images/toridori_icon.jpg'),
        ),
      ),
      drawer: MainPageDrawer(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
                          // todo: ボタン処理
                        },
                        child: Image.asset('images/home_top_gourmet.jpg'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Image.asset('images/home_top_travel.jpg'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Image.asset('images/home_top_leisure.jpg'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Image.asset('images/home_top_apparel.jpg'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Image.asset('images/home_top_beauty.jpg'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Image.asset('images/home_top_other.jpg'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                  children: [
                    Container(
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red.shade700,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                        ),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Text(
                          '全て',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red.shade700,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Text(
                          '報酬がもらえる',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red.shade700,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Text(
                          '同伴者も無料',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red.shade700,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onPressed: () {
                          // todo: ボタン処理
                        },
                        child: Text(
                          '自宅でできる',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 250,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Placeholder(),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Placeholder(),
                    ))
                  ],
                ),
              ),
              Container(
                height: 250,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Placeholder(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Placeholder(),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20)
            ],
          );
        },
      ),
    );
  }
}
