import 'package:flutter/material.dart';

enum NotificationKind { invite, reminder, result, cancelled }

extension NotificationKindIcon on NotificationKind {
  IconData get icon {
    switch (this) {
      case NotificationKind.invite:
        return Icons.golf_course_outlined;
      case NotificationKind.reminder:
        return Icons.access_time_rounded;
      case NotificationKind.result:
        return Icons.emoji_events_outlined;
      case NotificationKind.cancelled:
        return Icons.cancel_outlined;
    }
  }
}

class NotificationItem {
  final String id;
  final NotificationKind kind;
  final String title;
  final String message;
  final String time;
  final bool isRead;

  const NotificationItem({
    required this.id,
    required this.kind,
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
  });

  NotificationItem copyWith({bool? isRead}) {
    return NotificationItem(
      id: id,
      kind: kind,
      title: title,
      message: message,
      time: time,
      isRead: isRead ?? this.isRead,
    );
  }
}