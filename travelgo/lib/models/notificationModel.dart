import 'package:flutter/cupertino.dart';

class NotificationModel {
  final String notificationType;
  final RichText notificationBody;
  final String date;

  NotificationModel(
      {Key? key,
      required this.notificationBody,
      required this.notificationType,
      required this.date});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationType: json['notificationType'],
      date: json['date'],
      notificationBody: json['notificationBody'],
    );
  }
}
