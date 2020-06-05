import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_db/data/moor_database.dart';
import 'package:sql_db/utilities/text_style.dart';
import 'package:sql_db/widgets/snackbar.dart';
import '../widgets/massage_buble.dart';

class QueueSmsDetails extends StatefulWidget {
  final smsQueItem;

  QueueSmsDetails({@required this.smsQueItem});

  @override
  _QueueSmsDetailsState createState() => _QueueSmsDetailsState();
}

class _QueueSmsDetailsState extends State<QueueSmsDetails> {
  @override
  Widget build(BuildContext context) {
    final SmsQueueDao dao = Provider.of<SmsQueueDao>(context);
    var smsItem = widget.smsQueItem;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          smsItem.mobileNo,
          style: kBigTitleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              dao.deleteSmsQueue(smsItem);
              // deleteQueueSms(
              //   context: context,
              //   id: widget.smsQueItem.id,
              //   mobile: widget.smsQueItem.mobileNo,
              // );
              mySnackBar(context: context, msg: 'Sms Successfully Deleted!');
              // Navigator.pop(context);
              setState(() {
                smsItem = widget.smsQueItem;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return smsItem == null
                          ? Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Bubble(
                                    message: smsItem.massage,
                                    isMe: false,
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
