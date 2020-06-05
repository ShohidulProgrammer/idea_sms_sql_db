//import 'package:flutter/material.dart';
//import 'package:idea_sms/db/utils/db_helper.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import 'alert_style.dart';
//import 'animation_transition.dart';
//import 'snackbar.dart';
//
//DatabaseHelper dbHelper = DatabaseHelper.db;
//
//Future<void> myAlertDialog(
//    {BuildContext context,
//    String title,
//    String desc,
//    VoidCallback okFun,
//    String mobile}) async {
//  return await showDialog<void>(
//      context: context,
//      builder: (BuildContext context) {
//        return Center(
//          child: SingleChildScrollView(
//            child: AlertDialog(
////              backgroundColor: kAlertStyle.backgroundColor,
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(10.0),
//                side: BorderSide(
//                  color: Colors.blueGrey,
//                ),
//              ),
//              titlePadding: EdgeInsets.all(0.0),
//              title: Container(
//                child: Center(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.all(20.0),
////                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                        child: Column(
//                          children: <Widget>[
//                            SizedBox(
//                              height: 15,
//                            ),
//                            Text(
//                              title,
//                              style: kTitleStyle,
//                              textAlign: TextAlign.center,
//                            ),
//                            SizedBox(
//                              height: desc == null ? 5 : 10,
//                            ),
//                            desc == null
//                                ? Container()
//                                : Text(
//                                    desc,
//                                    style: kSubTitleStyle,
//                                    textAlign: TextAlign.center,
//                                  ),
//                          ],
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              ),
////                  contentPadding: kButtonAreaPadding,
//
//              actions: <Widget>[
//                FlatButton(
//                  child: Text(
//                    'Yes',
//                    textAlign: TextAlign.center,
//                  ),
//                  onPressed: () {
//                    dbHelper.deleteMassages(
//                        table: dbHelper.historyTable, mobile: mobile);
//                    mySnackBar(
//                        context: context,
//                        msg:
//                            'All Massages successfully deleted for this Mobile No!');
//                    //              refreshList(),
//                    Navigator.of(context).pop();
//                  },
//                ),
//                FlatButton(
//                  child: Text(
//                    'Cancel',
//                    textAlign: TextAlign.center,
//                  ),
//                  onPressed: () {
//                    mySnackBar(context: context, msg: 'Cancel');
//                    //              refreshList(),
//                    Navigator.of(context).pop();
//                  },
//                ),
//              ],
//            ),
//          ),
//        );
//      });
//}
