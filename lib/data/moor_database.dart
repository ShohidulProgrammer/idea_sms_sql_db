import 'package:moor_flutter/moor_flutter.dart';

import '../db_config.dart';
import 'table/sms_histories.dart';
import 'table/sms_queues.dart';
part 'moor_database.g.dart';

@UseMoor(tables: [SmsQueues, SmsHistories], daos: [SmsQueueDao, SmsHistoryDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [
  SmsQueues
], queries: {
  'deleteAllSmsQueues': 'DELETE FROM SmsQueues;',
  'getSmsQueue':
      'SELECT * SmsQueues WHERE mobileNo = mobileNo ORDER BY date DESC,  '
})
class SmsQueueDao extends DatabaseAccessor<AppDatabase>
    with _$SmsQueueDaoMixin {
  //  final AppDatabase db;
  AppDatabase db = DataBase.db;
  SmsQueueDao(this.db) : super(db);

  Future<List<SmsQueue>> getAllSmsQueue() => select(smsQueues).get();
  Stream<List<SmsQueue>> watchAllSmsQueue() => select(smsQueues).watch();
  Future insertSmsQueue(Insertable<SmsQueue> smsQueue) =>
      into(smsQueues).insert(smsQueue);
  Future updateSmsQueue(Insertable<SmsQueue> smsQueue) =>
      update(smsQueues).replace(smsQueue);
  Future deleteSmsQueue(Insertable<SmsQueue> smsQueue) =>
      delete(smsQueues).delete(smsQueue);
}

@UseDao(tables: [
  SmsHistories
], queries: {
  'deleteAllSmsHistories': 'DELETE FROM SmsHistories;',
  'getSmsHistory':
      'SELECT * SmsHistories WHERE mobileNo = mobileNo ORDER BY date DESC,  '
})
class SmsHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$SmsHistoryDaoMixin {
  final AppDatabase db;
  SmsHistoryDao(this.db) : super(db);

  Future<List<SmsHistorie>> getAllSmsHistory() => select(smsHistories).get();

  // Future watchOneSmsHistory(SmsHistorie smsHistory) {
  //   {
  //   return (select(smsHistory)
  //       ).where(smsHistory.id)
  //       .watch();
  // }
  // }

  Stream<List<SmsHistorie>> watchAllSmsHistory() =>
      select(smsHistories).watch();

  Stream<List<SmsHistorie>> watchAllSmsHistoryOrderByDate() {
    return (select(smsHistories)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
            // (t) => OrderingTerm(expression: t.userName),
          ]))
        .watch();
  }

  Stream<List<SmsHistorie>> watchSendSmsHistory({bool success = true}) {
    return (select(smsHistories)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
            // (t) => OrderingTerm(expression: t.userName),
          ])
          ..where((t) => t.send.equals(success)))
        .watch();
  }

  Future insertSmsHistory(Insertable<SmsHistorie> smsHistory) =>
      into(smsHistories).insert(smsHistory);
  Future updateSmsHistory(Insertable<SmsHistorie> smsHistory) =>
      update(smsHistories).replace(smsHistory);
  Future deleteSmsHistory(Insertable<SmsHistorie> smsHistory) =>
      delete(smsHistories).delete(smsHistory);
}
