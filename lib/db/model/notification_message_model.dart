import 'package:flutter/material.dart';

@immutable
class NotificationMessage {
  final String title;
  final String body;

  const NotificationMessage({
    @required this.title,
    @required this.body,
  });
}