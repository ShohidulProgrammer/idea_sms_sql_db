// import 'dart:async';
// import 'package:sql_db/data/model/sms_queue_model.dart';

// import 'abst_source.dart';
// import 'http_helper.dart';

// class Repository {
//   final smsHttpProvider = SmsHttpProvider();
//   List<Source> sources = <Source>[
//     SmsHttpProvider(),
//   ];
//   Future<SmsQueueModel> fetchItem(int id) async {
//     SmsQueueModel smsItem;
//     var source;

//     for (source in sources) {
//       smsItem = await source.fetchItem(id);
//       if (smsItem != null) {
//         break;
//       }
    // }

    // for (var cache in caches) {
    //   if (cache != source) {
    //     cache.addItem(smsItem);
    //   }
    // }

//     return smsItem;
//   }

//   // clearCache() async {
//   //   for (var cache in caches) {
//   //     await cache.clear();
//   //   }
//   // }
// }
