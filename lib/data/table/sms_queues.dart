 
 import 'package:moor_flutter/moor_flutter.dart';

class SmsQueues extends Table {
  //  autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mobileNo => text().withLength(min: 3, max: 15)();
  TextColumn get userName => text().nullable().withLength(min: 3, max: 50)();
  TextColumn get massage => text().nullable().withLength(max: 200)();
}
