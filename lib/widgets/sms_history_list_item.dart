import 'package:flutter/material.dart';
import '../pages/sms_history_detals.dart';
import '../utilities/date_formatter.dart' as duration;

class SmsHistoryItemWidget extends StatelessWidget {
  final smsHistory;

  SmsHistoryItemWidget({Key key, @required this.smsHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parsedDate = DateTime.parse(smsHistory.date);
    String date = duration.formateDate(parsedDate);
    return InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SmsHistoryDetails(
                      mobile: smsHistory.mobileNo,
                    ))),
        child: ListTile(
          leading: smsHistory.send
              ? Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : Icon(
                  Icons.sms_failed,
                  color: Colors.red,
                ),
          title: Text(smsHistory.mobileNo),
          subtitle: Text(smsHistory.userName ?? ''),
          trailing: Text(
            smsHistory.date == '2018,9,15' ? '' : date,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ));
  }
}
