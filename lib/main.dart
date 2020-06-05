import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_db/data/moor_database.dart';
import 'db_config.dart';
import 'router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppDatabase db = DataBase.db;
    // static final db = AppDatabase();
    // final httpDb = SmsHttpProvider();
    return MultiProvider(
        providers: [
          // Provider(builder: (_) => httpDb.fetchAllMassages()),
          Provider(builder: (_) => db.smsQueueDao),
          Provider(builder: (_) => db.smsHistoryDao),
          // Provider(builder: (_) => sendQueueSms),
          // Provider(builder: (_) => SendQueueSmsBlock),

          // ChangeNotifierProvider<SendQueueSmsBlock>.value(
          //   value: SendQueueSmsBlock(),
          // ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sms Sender',
          theme: new ThemeData(
            scaffoldBackgroundColor: Color(0xfffafaff),
            // primaryColor: mainBlue,
            // fontFamily: 'SF Pro Display',
          ),
          routes: routes,
        ));
  }
}
