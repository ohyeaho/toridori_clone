import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toridori_clone/components/back_appbar.dart';
import 'package:toridori_clone/components/loading_widget.dart';
import 'package:toridori_clone/screens/appbar_drawer/profile/profile_config/profile/profile_page_model.dart';
import 'package:toridori_clone/utils/firestore/users.dart';

class PayeePage extends StatefulWidget {
  const PayeePage({Key? key}) : super(key: key);

  @override
  _PayeePageState createState() => _PayeePageState();
}

class _PayeePageState extends State<PayeePage> {
  TextEditingController payeeController = TextEditingController();
  TextEditingController bankAccountTypeController = TextEditingController();
  TextEditingController bankBranchController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  TextEditingController bankHolderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future(() async {
      var userData = await UserFirestore.getUser();
      setState(() {});
      payeeController = TextEditingController(text: userData['payee']);
      bankAccountTypeController = TextEditingController(text: userData['bankAccountType']);
      bankBranchController = TextEditingController(text: userData['bankBranch']);
      bankNumberController = TextEditingController(text: userData['bankNumber']);
      bankHolderController = TextEditingController(text: userData['other_bankNumber']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel(),
      child: Stack(
        children: [
          Scaffold(
            appBar: BackAppbar.createAppBar('銀行口座を設定する'),
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

                            /// 振込先
                            // todo: 選択型
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '振込先',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: payeeController,
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

                            /// 口座種別
                            // todo: 選択型
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '口座種別',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: bankAccountTypeController,
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

                            /// 支店
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '支店',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: bankBranchController,
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

                            /// 口座番号
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '口座番号',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: bankNumberController,
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

                            /// 口座名義
                            Container(
                              color: Colors.red.withOpacity(0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '口座名義',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: bankHolderController,
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
                              var result = await UserFirestore.updatePayee(
                                payee: payeeController.text,
                                bankAccountType: bankAccountTypeController.text,
                                bankBranch: bankBranchController.text,
                                bankNumber: bankNumberController.text,
                                bankHolder: bankHolderController.text,
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
