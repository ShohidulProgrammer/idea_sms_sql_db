// get all smsQueues table
import 'package:provider/provider.dart';
import '../moor_database.dart';

// Stream<List<SmsQueue>> watchAllsmsQueuesData(context) async* {
//   final dao = Provider.of<SmsQueueDao>(context);
//   var smsQueues = dao.watchAllSmsQueue();
//   yield* smsQueues;

//   // return smsQueues;
// }

Future<List<SmsQueue>> getAllsmsQueuesData(context) {
  final dao = Provider.of<SmsQueueDao>(context);
  var smsQueues = dao.getAllSmsQueue();



  return smsQueues;
}
