import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toridori_clone/components/back_appbar.dart';
import 'package:toridori_clone/components/loading_widget.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/profile/profile_page_model.dart';
import 'package:toridori_clone/utils/firestore/users.dart';

class AddressTelPage extends StatefulWidget {
  const AddressTelPage({Key? key}) : super(key: key);

  @override
  _AddressTelPageState createState() => _AddressTelPageState();
}

class _AddressTelPageState extends State<AddressTelPage> {
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController prefectureController = TextEditingController();
  TextEditingController municipalitiesController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController otherAddressController = TextEditingController();
  TextEditingController telController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future(() async {
      var userData = await UserFirestore.getUser();
      setState(() {});
      zipcodeController = TextEditingController(text: userData['zipcode']);
      prefectureController = TextEditingController(text: userData['prefecture']);
      municipalitiesController = TextEditingController(text: userData['municipalities']);
      addressController = TextEditingController(text: userData['address']);
      otherAddressController = TextEditingController(text: userData['other_address']);
      telController = TextEditingController(text: userData['tel']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel(),
      child: Stack(
        children: [
          Scaffold(
            appBar: BackAppbar.createAppBar('住所・電話番号を設定する'),
            body: Consumer<ProfileModel>(builder: (context, model, child) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),

                            /// 郵便番号
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '郵便番号',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: zipcodeController,
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),

                            /// 都道府県
                            // todo: 選択型
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '都道府県',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: prefectureController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),

                            /// 市区町村
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '市区町村',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: municipalitiesController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),

                            /// 住所
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '住所',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: addressController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),

                            /// 建物名・部屋番号
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '建物名・部屋番号',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: otherAddressController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),

                            /// 電話番号
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '電話番号',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: telController,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(8, 1, 0, 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 150),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// 変更保存ボタン
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 80,
                      color: Colors.black,
                      child: Center(
                        child: Container(
                          width: 300,
                          child: TextButton(
                            onPressed: () async {
                              model.startLoading();
                              var result = await UserFirestore.updateAddressTel(
                                zipcode: zipcodeController.text,
                                prefecture: prefectureController.text,
                                municipalities: municipalitiesController.text,
                                address: addressController.text,
                                otherAddress: otherAddressController.text,
                                tel: telController.text,
                              );
                              if (result == true) {
                                print('変更を保存しました');
                                model.endLoading();
                                Navigator.pop(context, true);
                              }
                            },
                            child: Text(
                              '変更を保存する',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              primary: Colors.white,
                              backgroundColor: Colors.red.shade800,
                              shape: StadiumBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          Consumer<ProfileModel>(builder: (context, model, child) {
            return model.isLoading
                ? Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: LoadingWidget.circleLoading,
                    ),
                  )
                : SizedBox();
          }),
        ],
      ),
    );
  }
}
