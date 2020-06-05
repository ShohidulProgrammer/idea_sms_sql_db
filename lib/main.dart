import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'db/utils/db_helper.dart';
import 'router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sms Sender',
      theme: new ThemeData(
          scaffoldBackgroundColor: Color(0xfffafaff), buttonColor: Colors.grey),
      routes: routes,
    );
  }
}
