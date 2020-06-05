// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class SmsQueue extends DataClass implements Insertable<SmsQueue> {
  final int id;
  final String mobileNo;
  final String userName;
  final String massage;
  SmsQueue(
      {@required this.id,
      @required this.mobileNo,
      this.userName,
      this.massage});
  factory SmsQueue.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SmsQueue(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      mobileNo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mobile_no']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      massage:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}massage']),
    );
  }
  factory SmsQueue.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return SmsQueue(
      id: serializer.fromJson<int>(json['id']),
      mobileNo: serializer.fromJson<String>(json['mobileNo']),
      userName: serializer.fromJson<String>(json['userName']),
      massage: serializer.fromJson<String>(json['massage']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'mobileNo': serializer.toJson<String>(mobileNo),
      'userName': serializer.toJson<String>(userName),
      'massage': serializer.toJson<String>(massage),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<SmsQueue>>(bool nullToAbsent) {
    return SmsQueuesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      mobileNo: mobileNo == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileNo),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      massage: massage == null && nullToAbsent
          ? const Value.absent()
          : Value(massage),
    ) as T;
  }

  SmsQueue copyWith(
          {int id, String mobileNo, String userName, String massage}) =>
      SmsQueue(
        id: id ?? this.id,
        mobileNo: mobileNo ?? this.mobileNo,
        userName: userName ?? this.userName,
        massage: massage ?? this.massage,
      );
  @override
  String toString() {
    return (StringBuffer('SmsQueue(')
          ..write('id: $id, ')
          ..write('mobileNo: $mobileNo, ')
          ..write('userName: $userName, ')
          ..write('massage: $massage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(mobileNo.hashCode, $mrjc(userName.hashCode, massage.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is SmsQueue &&
          other.id == id &&
          other.mobileNo == mobileNo &&
          other.userName == userName &&
          other.massage == massage);
}

class SmsQueuesCompanion extends UpdateCompanion<SmsQueue> {
  final Value<int> id;
  final Value<String> mobileNo;
  final Value<String> userName;
  final Value<String> massage;
  const SmsQueuesCompanion({
    this.id = const Value.absent(),
    this.mobileNo = const Value.absent(),
    this.userName = const Value.absent(),
    this.massage = const Value.absent(),
  });
  SmsQueuesCompanion copyWith(
      {Value<int> id,
      Value<String> mobileNo,
      Value<String> userName,
      Value<String> massage}) {
    return SmsQueuesCompanion(
      id: id ?? this.id,
      mobileNo: mobileNo ?? this.mobileNo,
      userName: userName ?? this.userName,
      massage: massage ?? this.massage,
    );
  }
}

class $SmsQueuesTable extends SmsQueues
    with TableInfo<$SmsQueuesTable, SmsQueue> {
  final GeneratedDatabase _db;
  final String _alias;
  $SmsQueuesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _mobileNoMeta = const VerificationMeta('mobileNo');
  GeneratedTextColumn _mobileNo;
  @override
  GeneratedTextColumn get mobileNo => _mobileNo ??= _constructMobileNo();
  GeneratedTextColumn _constructMobileNo() {
    return GeneratedTextColumn('mobile_no', $tableName, false,
        minTextLength: 3, maxTextLength: 15);
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn('user_name', $tableName, true,
        minTextLength: 3, maxTextLength: 50);
  }

  final VerificationMeta _massageMeta = const VerificationMeta('massage');
  GeneratedTextColumn _massage;
  @override
  GeneratedTextColumn get massage => _massage ??= _constructMassage();
  GeneratedTextColumn _constructMassage() {
    return GeneratedTextColumn('massage', $tableName, true, maxTextLength: 200);
  }

  @override
  List<GeneratedColumn> get $columns => [id, mobileNo, userName, massage];
  @override
  $SmsQueuesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sms_queues';
  @override
  final String actualTableName = 'sms_queues';
  @override
  VerificationContext validateIntegrity(SmsQueuesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.mobileNo.present) {
      context.handle(_mobileNoMeta,
          mobileNo.isAcceptableValue(d.mobileNo.value, _mobileNoMeta));
    } else if (mobileNo.isRequired && isInserting) {
      context.missing(_mobileNoMeta);
    }
    if (d.userName.present) {
      context.handle(_userNameMeta,
          userName.isAcceptableValue(d.userName.value, _userNameMeta));
    } else if (userName.isRequired && isInserting) {
      context.missing(_userNameMeta);
    }
    if (d.massage.present) {
      context.handle(_massageMeta,
          massage.isAcceptableValue(d.massage.value, _massageMeta));
    } else if (massage.isRequired && isInserting) {
      context.missing(_massageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SmsQueue map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SmsQueue.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SmsQueuesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.mobileNo.present) {
      map['mobile_no'] = Variable<String, StringType>(d.mobileNo.value);
    }
    if (d.userName.present) {
      map['user_name'] = Variable<String, StringType>(d.userName.value);
    }
    if (d.massage.present) {
      map['massage'] = Variable<String, StringType>(d.massage.value);
    }
    return map;
  }

  @override
  $SmsQueuesTable createAlias(String alias) {
    return $SmsQueuesTable(_db, alias);
  }
}

class SmsHistorie extends DataClass implements Insertable<SmsHistorie> {
  final int id;
  final String mobileNo;
  final String userName;
  final String massage;
  final DateTime date;
  final bool send;
  SmsHistorie(
      {@required this.id,
      @required this.mobileNo,
      this.userName,
      this.massage,
      this.date,
      @required this.send});
  factory SmsHistorie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return SmsHistorie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      mobileNo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mobile_no']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      massage:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}massage']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      send: boolType.mapFromDatabaseResponse(data['${effectivePrefix}send']),
    );
  }
  factory SmsHistorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return SmsHistorie(
      id: serializer.fromJson<int>(json['id']),
      mobileNo: serializer.fromJson<String>(json['mobileNo']),
      userName: serializer.fromJson<String>(json['userName']),
      massage: serializer.fromJson<String>(json['massage']),
      date: serializer.fromJson<DateTime>(json['date']),
      send: serializer.fromJson<bool>(json['send']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'mobileNo': serializer.toJson<String>(mobileNo),
      'userName': serializer.toJson<String>(userName),
      'massage': serializer.toJson<String>(massage),
      'date': serializer.toJson<DateTime>(date),
      'send': serializer.toJson<bool>(send),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<SmsHistorie>>(bool nullToAbsent) {
    return SmsHistoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      mobileNo: mobileNo == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileNo),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      massage: massage == null && nullToAbsent
          ? const Value.absent()
          : Value(massage),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      send: send == null && nullToAbsent ? const Value.absent() : Value(send),
    ) as T;
  }

  SmsHistorie copyWith(
          {int id,
          String mobileNo,
          String userName,
          String massage,
          DateTime date,
          bool send}) =>
      SmsHistorie(
        id: id ?? this.id,
        mobileNo: mobileNo ?? this.mobileNo,
        userName: userName ?? this.userName,
        massage: massage ?? this.massage,
        date: date ?? this.date,
        send: send ?? this.send,
      );
  @override
  String toString() {
    return (StringBuffer('SmsHistorie(')
          ..write('id: $id, ')
          ..write('mobileNo: $mobileNo, ')
          ..write('userName: $userName, ')
          ..write('massage: $massage, ')
          ..write('date: $date, ')
          ..write('send: $send')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          mobileNo.hashCode,
          $mrjc(userName.hashCode,
              $mrjc(massage.hashCode, $mrjc(date.hashCode, send.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is SmsHistorie &&
          other.id == id &&
          other.mobileNo == mobileNo &&
          other.userName == userName &&
          other.massage == massage &&
          other.date == date &&
          other.send == send);
}

class SmsHistoriesCompanion extends UpdateCompanion<SmsHistorie> {
  final Value<int> id;
  final Value<String> mobileNo;
  final Value<String> userName;
  final Value<String> massage;
  final Value<DateTime> date;
  final Value<bool> send;
  const SmsHistoriesCompanion({
    this.id = const Value.absent(),
    this.mobileNo = const Value.absent(),
    this.userName = const Value.absent(),
    this.massage = const Value.absent(),
    this.date = const Value.absent(),
    this.send = const Value.absent(),
  });
  SmsHistoriesCompanion copyWith(
      {Value<int> id,
      Value<String> mobileNo,
      Value<String> userName,
      Value<String> massage,
      Value<DateTime> date,
      Value<bool> send}) {
    return SmsHistoriesCompanion(
      id: id ?? this.id,
      mobileNo: mobileNo ?? this.mobileNo,
      userName: userName ?? this.userName,
      massage: massage ?? this.massage,
      date: date ?? this.date,
      send: send ?? this.send,
    );
  }
}

class $SmsHistoriesTable extends SmsHistories
    with TableInfo<$SmsHistoriesTable, SmsHistorie> {
  final GeneratedDatabase _db;
  final String _alias;
  $SmsHistoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _mobileNoMeta = const VerificationMeta('mobileNo');
  GeneratedTextColumn _mobileNo;
  @override
  GeneratedTextColumn get mobileNo => _mobileNo ??= _constructMobileNo();
  GeneratedTextColumn _constructMobileNo() {
    return GeneratedTextColumn('mobile_no', $tableName, false,
        minTextLength: 3, maxTextLength: 15);
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn('user_name', $tableName, true,
        minTextLength: 3, maxTextLength: 50);
  }

  final VerificationMeta _massageMeta = const VerificationMeta('massage');
  GeneratedTextColumn _massage;
  @override
  GeneratedTextColumn get massage => _massage ??= _constructMassage();
  GeneratedTextColumn _constructMassage() {
    return GeneratedTextColumn('massage', $tableName, true, maxTextLength: 200);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _sendMeta = const VerificationMeta('send');
  GeneratedBoolColumn _send;
  @override
  GeneratedBoolColumn get send => _send ??= _constructSend();
  GeneratedBoolColumn _constructSend() {
    return GeneratedBoolColumn('send', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, mobileNo, userName, massage, date, send];
  @override
  $SmsHistoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sms_histories';
  @override
  final String actualTableName = 'sms_histories';
  @override
  VerificationContext validateIntegrity(SmsHistoriesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.mobileNo.present) {
      context.handle(_mobileNoMeta,
          mobileNo.isAcceptableValue(d.mobileNo.value, _mobileNoMeta));
    } else if (mobileNo.isRequired && isInserting) {
      context.missing(_mobileNoMeta);
    }
    if (d.userName.present) {
      context.handle(_userNameMeta,
          userName.isAcceptableValue(d.userName.value, _userNameMeta));
    } else if (userName.isRequired && isInserting) {
      context.missing(_userNameMeta);
    }
    if (d.massage.present) {
      context.handle(_massageMeta,
          massage.isAcceptableValue(d.massage.value, _massageMeta));
    } else if (massage.isRequired && isInserting) {
      context.missing(_massageMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    if (d.send.present) {
      context.handle(
          _sendMeta, send.isAcceptableValue(d.send.value, _sendMeta));
    } else if (send.isRequired && isInserting) {
      context.missing(_sendMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SmsHistorie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SmsHistorie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SmsHistoriesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.mobileNo.present) {
      map['mobile_no'] = Variable<String, StringType>(d.mobileNo.value);
    }
    if (d.userName.present) {
      map['user_name'] = Variable<String, StringType>(d.userName.value);
    }
    if (d.massage.present) {
      map['massage'] = Variable<String, StringType>(d.massage.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    if (d.send.present) {
      map['send'] = Variable<bool, BoolType>(d.send.value);
    }
    return map;
  }

  @override
  $SmsHistoriesTable createAlias(String alias) {
    return $SmsHistoriesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $SmsQueuesTable _smsQueues;
  $SmsQueuesTable get smsQueues => _smsQueues ??= $SmsQueuesTable(this);
  $SmsHistoriesTable _smsHistories;
  $SmsHistoriesTable get smsHistories =>
      _smsHistories ??= $SmsHistoriesTable(this);
  SmsQueueDao _smsQueueDao;
  SmsQueueDao get smsQueueDao =>
      _smsQueueDao ??= SmsQueueDao(this as AppDatabase);
  SmsHistoryDao _smsHistoryDao;
  SmsHistoryDao get smsHistoryDao =>
      _smsHistoryDao ??= SmsHistoryDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [smsQueues, smsHistories];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$SmsQueueDaoMixin on DatabaseAccessor<AppDatabase> {
  $SmsQueuesTable get smsQueues => db.smsQueues;
}

mixin _$SmsHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $SmsHistoriesTable get smsHistories => db.smsHistories;
}
