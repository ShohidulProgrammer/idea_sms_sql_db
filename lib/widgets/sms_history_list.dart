import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:idea_sms/sms_helper/make_ready_to_send_sms.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../sms_helper/make_ready_to_send_sms.dart';
import '../utilities/alert_style.dart';
import '../db/model/sms_history_model.dart';
import '../db/utils/db_helper.dart';
import '../utilities/list_separator.dart';
import '../widgets/sms_history_list_item.dart';
import '../utilities/snackbar.dart';

DatabaseHelper dbHelper = DatabaseHelper.db;

class SmsHistoryList extends StatefulWidget {
  final String appTitle = 'Sms History';

  @override
  _SmsHistoryListState createState() => _SmsHistoryListState();
}

class _SmsHistoryListState extends State<SmsHistoryList> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  Future<List<SmsHistoryModel>> _listFuture;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
        actions: <Widget>[
          // Refresh History List View
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              refreshList();
            },
          ),
          // Delete All Data from History table
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              String title = 'Confirm deletion';
              String desc = 'Are you sure to delete all these messages?';
              int ok = 0;
              Alert(
                context: context,
                style: kAlertStyle,
                title: title,
                desc: desc,
                buttons: [
                  DialogButton(
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => {
                      dbHelper.deleteAll(table: dbHelper.historyTable),
                      mySnackBar(
                          context: context,
                          msg: 'All Sms History Deleted successfully!'),
                      refreshList(),
                      Navigator.pop(context),
                    },
                  ),
                  DialogButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ).show();
            },
          ),
        ],
      ),
      body: Container(
        child: _buildSmsHistoryList(context),
      ),
    );
  }

  Widget _buildSmsHistoryList(BuildContext context) {
    return FutureBuilder<List<SmsHistoryModel>>(
//        future: dbHelper.getAllHistories(),
        future: _listFuture,
        builder: (context, AsyncSnapshot<List<SmsHistoryModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length,
              itemBuilder: (_, int index) {
                SmsHistoryModel smsHistoryItem = snapshot.data[index];
                return historyListItem(
                  smsHistory: smsHistoryItem,
                  child: SmsHistoryItemWidget(
                    smsHistory: smsHistoryItem,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  kListSparatorDivider(),
            );
          } else if (snapshot.hasError) {
            debugPrint('Snap Shot Data: ${snapshot.data}');
            return Center(child: Text('There was an error'));
          } else {
            // return Center(child: CircularProgressIndicator());
            return Center(child: Text('No Value yet'));
          }
        });
  }

// sms history list item
  Widget historyListItem({SmsHistoryModel smsHistory, Widget child}) {
    return Slidable(
      child: child,
      actionPane: SlidableBehindActionPane(),
      secondaryActions: <Widget>[
        //  delete List  item
        IconSlideAction(
            key: UniqueKey(),
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              dbHelper.deleteMassages(
                  table: dbHelper.historyTable, mobile: smsHistory.mobileNo);

              mySnackBar(
                  context: context,
                  msg:
                      'All Massages successfully deleted for Mobile No: ${smsHistory.mobileNo}!');
              setState(() {
                refreshList();
              });
            }),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // notification handle on foreground state
    getNotification();
    // permission for showing notification on status bar for ios
    _fcm.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

    // initial List load
    _listFuture = dbHelper.getAllMobileHistories();
  }

  void refreshList() {
    // reload
    setState(() {
      _listFuture = dbHelper.getAllMobileHistories();
    });
    mySnackBar(context: context, msg: 'Refresh successfully!');
  }

  Future<dynamic> _handleNotification(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      print("\nNotification was received");
      var data = message['data'] ?? message;
      String url = data['url'];
      print('\nUrl ${++i} : $url');

      // send sms
      makeReadyToSendSms(context: this.context, url: url);
    } else {
      print("This is not a data message");
    }

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        refreshList();
      });
    });
  }

  void getNotification() {
    _fcm.configure(
      onMessage: _handleNotification,
      onLaunch: _handleNotification,
      onResume: _handleNotification,
    );
  }
}
