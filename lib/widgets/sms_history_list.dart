import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sql_db/data/moor_database.dart';
import 'package:sql_db/utilities/list_separator.dart';
import 'package:sql_db/widgets/sms_history_list_item.dart';
import 'package:sql_db/widgets/snackbar.dart';

class SmsHistoryList extends StatefulWidget {
  @override
  _SmsHistoryListState createState() => _SmsHistoryListState();
}

class _SmsHistoryListState extends State<SmsHistoryList> {
  // bool successfulySend;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSmsHistoryList(context),
    );
  }

  StreamBuilder<List<SmsHistorie>> _buildSmsHistoryList(BuildContext context) {
    final SmsHistoryDao dao = Provider.of<SmsHistoryDao>(context);
    return StreamBuilder(
      // stream: successfulySend
      //     ? dao.watchSendSmsHistory(success: successfulySend)
      //     : dao.watchAllSmsHistoryOrderByDate(),
      stream: dao.watchAllSmsHistoryOrderByDate(),

      builder: (context, AsyncSnapshot<List<SmsHistorie>> snapshot) {
        final smsHistories = snapshot.data ?? List();

        return smsHistories == null
            ? Center(
                child: Column(
                children: <Widget>[
                  Text('No Data Available in Sms History'),
                  CircularProgressIndicator(),
                ],
              ))
            : ListView.separated(
                itemCount: smsHistories.length,
                itemBuilder: (_, int index) {
                  final smsHistory = smsHistories[index];
                  return historyListItem(
                    smsHistory: smsHistory,
                    child: SmsHistoryListItem(
                      smsHistory: smsHistory,
                      smsDao: dao,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    klistSparatorDivider(),
              );
      },
    );
  }

// sms history list item
  Widget historyListItem({
    SmsHistorie smsHistory,
    SmsHistoryDao dao,
    Widget child,
  }) {
    return Slidable(
      child: child,
      actionPane: SlidableBehindActionPane(),
      secondaryActions: <Widget>[
        //  delete List  item
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              dao.deleteSmsHistory(smsHistory);
              // dao.executor['DELETE FROM SmsHistories;'];
              mySnackBar(context: context, msg: 'Sms Successfully Deleted!');
            }
            // mySnackBar(
            //     context: context,
            //     msg: '${smsHistory.mobileNo} is Successfully Deleted '),
            ),
      ],
    );
  }
  // check send switch
}
