// insert sms to History table
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

import '../moor_database.dart';

saveHistory({
  BuildContext context,
  int id,
  @required String mobile,
  String user,
  String massage,
  @required bool send,
}) async {
  final dao = Provider.of<SmsHistoryDao>(context);
  var sms;

  id == null
      ? sms = SmsHistoriesCompanion(
          mobileNo: Value(mobile),
          userName: Value(user),
          massage: Value(massage),
          send: Value(send),
          date: Value(DateTime.now()))
      : sms = SmsHistoriesCompanion(
          id: Value(id),
          mobileNo: Value(mobile),
          userName: Value(user),
          massage: Value(massage),
          send: Value(send),
          date: Value(DateTime.now()));

  final smsHistory = sms;

  id == null
      ? await dao.insertSmsHistory(smsHistory)
      : await dao.updateSmsHistory(smsHistory);
}
