import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sql_db/data/moor_database.dart';

// insert sms to History table
updateHistory({
  BuildContext context,
  int id,
  String mobile,
  bool send,
  DateTime date,
}) {
  final dao = Provider.of<SmsHistoryDao>(context);

  final smsHistory = SmsHistoriesCompanion(
      id: Value(id),
      mobileNo: Value(mobile),
      send: Value(send),
      date: Value(date));
  dao.updateSmsHistory(
      smsHistory.copyWith(date: smsHistory.date, send: smsHistory.send));
}
