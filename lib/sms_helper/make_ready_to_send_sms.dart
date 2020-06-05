import 'dart:async';
import 'package:flutter/material.dart';
import '../data/db_helper/insert_queue.dart';
import '../http_helper/get_dart.dart';
import '../sms_helper/send_sms_from_gueue.dart';

Future makeReadyToSendSms(BuildContext context) async {
  var smsQueueList;
  int i;
  String mobile = '01944700465';
  String user = 'Sajid';
  String massage = "internet is not available";

  try {
    // smsQueueList = await getWebDataIfInternetAvailable();
    smsQueueList = await getDataFromWeb();
  } catch (e) {
    print('\nnetwork error: $e');
  }

  // insert queue from web url
  try {
    for (i = 0; i < smsQueueList.length; i++) {
      // print('\nindex: $i values: ${smsQueueList[i]['mobileNo']}');
      mobile = await smsQueueList[i]['mobileNo'];
      user = await smsQueueList[i]['userName'];
      massage = await smsQueueList[i]['massage'];

      await insertQueue(
          context: context, mobile: mobile, user: user, massage: massage);
    }
  } catch (e) {
    print('\nsmsQue insertion error: $e');
  }

  // send sms from queue table
  try {
    sendSmsFromQueue(context);
  } catch (e) {
    print('\nsms send error: $e');
  }

  print('\nafter send sms from que the last line');
}
