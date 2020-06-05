import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_db/data/moor_database.dart';

// delete sms to History table
deleteQueueSms({BuildContext context, int id, String mobile}) {
  final dao = Provider.of<SmsQueueDao>(context);

  final smsQueue = SmsQueue(mobileNo: mobile, id: id);

  dao.deleteSmsQueue(smsQueue);
}
