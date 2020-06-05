// insert sms to Queue table
import 'package:flutter/widgets.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

import '../moor_database.dart';

insertQueue({
  BuildContext context,
  String mobile,
  String user,
  String massage,
}) {
  final dao = Provider.of<SmsQueueDao>(context);
  final smsQueue = SmsQueuesCompanion(
    mobileNo: Value(mobile),
    userName: Value(user),
    massage: Value(massage),
  );
  dao.insertSmsQueue(smsQueue);
}
