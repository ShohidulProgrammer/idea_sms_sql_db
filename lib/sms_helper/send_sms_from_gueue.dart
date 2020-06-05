// get all smsQueues table data then send sms to mobile device
import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:sql_db/data/moor_database.dart';
import '../data/db_helper/get_all_queue_data.dart';
import '../sms_helper/send_queue_sms.dart';

sendSmsFromQueue(BuildContext context) async {
  int i = 0;

  try {
    // smsQueueList = await getWebDataIfInternetAvailable();
    // final Stream<List<SmsQueue>> smsQueues = watchAllsmsQueuesData(context);
    final List<SmsQueue> smsQueues = await getAllsmsQueuesData(context);

    smsQueues.forEach((que) {
      sendQueueSms(
          context: context,
          user: que.userName,
          massage: que.massage,
          mobile: que.mobileNo,
          faild: 0);
      print('\n\n\nIndex: $i Queues Mobile No: ${que.mobileNo}\n\n\n');
      i++;
    });
  } catch (e) {
    print('\nqueue data read error: $e');
  }
}
