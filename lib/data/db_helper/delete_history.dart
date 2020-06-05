import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_db/data/moor_database.dart';

// delete sms to History table
deleteHistorySms(
    {BuildContext context, int id, String mobile, bool send = false}) {
  final dao = Provider.of<SmsHistoryDao>(context);

  final smsHistory = SmsHistorie(mobileNo: mobile, id: id, send: send);

  dao.deleteSmsHistory(smsHistory);
}
