import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sql_db/utilities/list_separator.dart';
import 'package:sql_db/widgets/snackbar.dart';
import '../data/moor_database.dart';
import '../widgets/sms_queue_list_item.dart';

class SmsQueueList extends StatefulWidget {
  @override
  _SmsQueueListState createState() => _SmsQueueListState();
}

class _SmsQueueListState extends State<SmsQueueList> {
  // bool successfulySend;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSmsQueueList(context),
    );
  }

  StreamBuilder<List<SmsQueue>> _buildSmsQueueList(BuildContext context) {
    final dao = Provider.of<SmsQueueDao>(context);
    return StreamBuilder(
      stream: dao.watchAllSmsQueue(),
      builder: (context, AsyncSnapshot<List<SmsQueue>> snapshot) {
        final smsQueues = snapshot.data ?? List();
        return ListView.separated(
          itemCount: smsQueues.length ?? 0,
          itemBuilder: (_, int index) {
            final smsQueue = smsQueues[index];
            return queueListItem(
              smsQueue: smsQueue,
              dao: dao,
              child: SmsQueueListItem(
                smsQueue: smsQueue,
                smsDao: dao,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              klistSparatorDivider(),
        );
      },
    );
  }

// sms history list item
  Widget queueListItem({SmsQueue smsQueue, SmsQueueDao dao, Widget child}) {
    return Slidable(
      child: child,
      actionPane: SlidableBehindActionPane(),
      secondaryActions: <Widget>[
        //  delete List  item
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              dao.deleteSmsQueue(smsQueue);
              mySnackBar(context: context, msg: 'Sms Successfully Deleted!');
            }
            // snackBar(
            //     context: context,
            //     msg: '${smsQueue.mobileNo}  is Successfully Deleted '),
            ),
      ],
    );
  }
}
