import 'package:flutter/foundation.dart';
import 'package:golf_app/models/notification_item.dart';

class NotificationsRepository extends ChangeNotifier {
  NotificationsRepository._internal();
  static final NotificationsRepository instance =
      NotificationsRepository._internal();

  List<NotificationItem> _notifications = const [
    NotificationItem(
      id: "1",
      kind: NotificationKind.invite,
      title: "Invitación a partida",
      message: "Carlos te invitó a jugar en Club La Paz este sábado",
      time: "Hace 5 min",
      isRead: false,
    ),
    NotificationItem(
      id: "2",
      kind: NotificationKind.reminder,
      title: "Torneo Domingo comienza pronto",
      message: "Tu partida empieza mañana a las 08:00 hrs",
      time: "Hace 2 h",
      isRead: false,
    ),
    NotificationItem(
      id: "3",
      kind: NotificationKind.result,
      title: "Resultado publicado",
      message: "Tu resultado en Copa Primavera ya está disponible",
      time: "Ayer",
      isRead: true,
    ),
    NotificationItem(
      id: "4",
      kind: NotificationKind.cancelled,
      title: "Partida cancelada",
      message:
          "La partida en Santa Cruz Golf fue cancelada por el organizador",
      time: "12 Abr 2026",
      isRead: true,
    ),
  ];

  List<NotificationItem> get notifications => _notifications;

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void markAsRead(String id) {
    _notifications = [
      for (final n in _notifications)
        if (n.id == id) n.copyWith(isRead: true) else n,
    ];
    notifyListeners();
  }

  void markAllAsRead() {
    _notifications = [
      for (final n in _notifications) n.copyWith(isRead: true),
    ];
    notifyListeners();
  }
}