import 'package:flutter/material.dart';
import 'package:idea_sms/db/model/sms_history_model.dart';
import 'package:idea_sms/utilities/alert_dialog.dart';
import 'package:idea_sms/utilities/alert_style.dart';
import 'package:idea_sms/utilities/my_alert_dialog.dart';
import 'package:idea_sms/widgets/sms_history_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../sms_helper/my_sms_sender.dart';
import '../db/utils/db_helper.dart';
import '../utilities/text_style.dart';
import '../utilities/snackbar.dart';
import '../widgets/massage_buble.dart';
import '../utilities/date_formatter.dart' as duration;

DatabaseHelper dbHelper = DatabaseHelper.db;

class SmsHistoryDetails extends StatefulWidget {
  final String mobile;

  SmsHistoryDetails({@required this.mobile});

  @override
  _SmsHistoryDetailsState createState() => _SmsHistoryDetailsState();
}

class _SmsHistoryDetailsState extends State<SmsHistoryDetails> {
  Future<List<SmsHistoryModel>> _listFuture;

  Future<bool> _onWillPop() {
    return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SmsHistoryList())) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            widget.mobile,
            style: kBigTitleTextStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                String title = 'Confirm deletion';
                String desc = 'Are you sure to delete all these messages?';
                myAlertDialog(
                    context: context,
                    title: title,
                    desc: desc,
                    mobile: widget.mobile);
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: FutureBuilder<List<SmsHistoryModel>>(
                        future: _listFuture,
                        builder: (context,
                            AsyncSnapshot<List<SmsHistoryModel>> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                SmsHistoryModel smsHistoryItem =
                                    snapshot.data[index];
                                var parsedDate =
                                    DateTime.parse(smsHistoryItem.date);
                                String date = duration.formateDate(parsedDate);
                                return Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          date,
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 9),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: smsHistoryItem.send
                                                ? SizedBox(
                                                    width: 0.0,
                                                    height: 0.0,
                                                  )
                                                : IconButton(
                                                    onPressed: () {
                                                      MySmsSender.reSendSms(
                                                          history:
                                                              smsHistoryItem);
                                                      mySnackBar(
                                                          context: context,
                                                          msg:
                                                              'SMS was trying to Resend!');
                                                    },
                                                    tooltip: 'Resend Sms',
                                                    icon: Icon(
                                                      Icons.redo,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                          ),
                                          Expanded(
                                            flex: 10,
                                            child: Bubble(
                                              message: smsHistoryItem.message,
                                              isMe: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            debugPrint('Snap Shot Data: ${snapshot.data}');
                            return Center(child: Text('There was an error'));
                          } else {
                            // return Center(child: CircularProgressIndicator());
                            return Center(child: Text('No Value yet'));
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      // initial List load
      _listFuture = dbHelper.getAllMessageHistory(mobile: widget.mobile);
    });
  }

  void refreshList() {
    // reload
    setState(() {
      _listFuture = dbHelper.getAllMessageHistory(mobile: widget.mobile);
//      dbHelper.getAllMobileHistories();
    });
  }

  Future<void> myAlertDialog(
      {BuildContext context,
      String title,
      String desc,
      VoidCallback okFun,
      String mobile}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(desc),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                dbHelper.deleteMassages(
                    table: dbHelper.historyTable, mobile: mobile);
                mySnackBar(
                    context: context,
                    msg:
                        'All Massages successfully deleted for this Mobile No!');
                Navigator.of(context).pop();
                refreshList();
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }
}
