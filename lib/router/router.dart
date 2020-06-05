import 'package:flutter/material.dart';
import 'package:idea_sms/utilities/refresh_list.dart';
import 'package:idea_sms/widgets/sms_history_list.dart';

final routes = {
  '/': (BuildContext context) => SmsHistoryList(),
  'refreshList': (BuildContext context) => RefreshList(),
};
