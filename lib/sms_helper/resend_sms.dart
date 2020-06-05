import 'package:flutter/material.dart';
import 'package:sql_db/data/db_helper/update_history.dart';
import 'package:sql_db/sms_helper/send_sms.dart';

// resend sms
// // Stream<List<SmsQueue>>
smsResend(BuildContext context, {int id, String mobile, String massage}) async {
// Set true if sms send successfuly
  bool send = await sendSms(massage: massage, mobile: mobile);

// Update sms History if sms send successfuly in resend method
  print('Send Sms: $send');
  if (send) {
    updateHistory(
        context: context,
        id: id,
        mobile: mobile,
        send: send,
        date: DateTime.now());
  } else {
    print('Can not Updated coz Send : send');
  }
}
