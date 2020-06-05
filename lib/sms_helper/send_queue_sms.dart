import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'package:sql_db/data/db_helper/insert_history.dart';

// send sms from queue table
sendQueueSms(
    {@required BuildContext context,
    @required String massage,
    @required String mobile,
    String user,
    int id,
    int faild}) async {
  // int _faild, maxFaild = 5;

//  SimCardsProvider provider = new SimCardsProvider();
// SimCard card = await provider.getSimCards()[0];

  SmsSender sender = new SmsSender();
  SmsMessage message = SmsMessage(mobile, massage);

  // check sms status
  message.onStateChanged.listen(
    (state) {
      if (state == SmsMessageState.Sent) {
        print('Sms Send Successfully');

        //add to history table here. don't use wait
        saveHistory(
            context: context,
            id: id,
            mobile: mobile,
            user: user,
            massage: massage,
            send: true);
        print('Insert sms history as successfully sends');
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      } else if (state == SmsMessageState.Fail) {
        print("\n\n\nSms Sending Faild!\n\n\n");

        saveHistory(
            context: context,
            id: id,
            mobile: mobile,
            user: user,
            massage: massage,
            send: false);
        print('Insert sms history as not sends');
      }
      // else if ((state == SmsMessageState.Fail) && (faild <= maxFaild)) {
      //   // sender.sendSms(message);
      //   // print("\n\n\nSMS is Fail $faild times! error:   $state\n\n\n");
      //   print("\n\n\nSms Sending Faild!\n\n\n");

      // sendQueueSms(
      //     context: context, massage: massage, mobile: mobile, faild: ++faild);

      // if (_faild > maxFaild) {
      //   saveHistory(
      //       context: context,
      //       id: id,
      //       mobile: mobile,
      //       user: user,
      //       massage: massage,
      //       send: false);
      // }
      // }
    },
    onError: (e) {
      print('Sms Sending Error: ${e.toString()} ');
    },
    cancelOnError: false,
    onDone: () {
      print('Sms Listening Done! ');
    },
  );

// send sms to mobile device
  sender.sendSms(message);
}
