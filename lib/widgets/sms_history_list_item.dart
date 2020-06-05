import 'package:flutter/material.dart';
import '../pages/sms_history_detals.dart';
import '../utilities/date_formatter.dart' as duration;

class SmsHistoryListItem extends StatefulWidget {
  final smsHistory;
  final smsDao;
  // final key;
  SmsHistoryListItem(
      {Key key, @required this.smsHistory, @required this.smsDao})
      : super(key: key);
  // SmsHistoryListItem(this.smsHistory, this.smsDao, this.key) : super(key: key);

  @override
  _SmsHistoryListItemState createState() => _SmsHistoryListItemState();
}

class _SmsHistoryListItemState extends State<SmsHistoryListItem> {
  // bool successfulySend = false;
  bool successfullySend;

  @override
  void initState() {
    super.initState();
    setState(() {
      // widget.smsHistory.send = true;
      successfullySend = widget.smsHistory.send;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        // onTap: () => Navigator.pushNamed(context, 'sms_history_details'),  
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SmsHistoryDetails(smsItem: widget.smsHistory))),
        child: ListTile(
          leading: successfullySend
              ? Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : Icon(
                  Icons.sms_failed,
                  color: Colors.red,
                ),
          title: Text(widget.smsHistory.mobileNo),
          subtitle: Text(widget.smsHistory.userName ?? ''),
          trailing: Text(
            widget.smsHistory.date == '2018,9,15'
                ? ''
                : duration.formateDate(widget.smsHistory.date),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ), // Text(widget.smsHistory.date?.toString() ?? ''),
        ));
  }
}
