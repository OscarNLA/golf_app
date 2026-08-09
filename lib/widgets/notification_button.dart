import 'package:flutter/material.dart';
import 'package:golf_app/repositories/notifications_repository.dart';
import 'package:golf_app/screens/notifications_screen.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: NotificationsRepository.instance,
      builder: (context, _) {
        final unreadCount = NotificationsRepository.instance.unreadCount;

        return Semantics(
          button: true,
          label: unreadCount > 0
              ? "Notificaciones, $unreadCount sin leer"
              : "Notificaciones",
          child: GestureDetector(
            onTap: () => showNotificationsOverlay(context),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: .08),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: .10),
                    ),
                  ),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),

                if (unreadCount > 0)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE53935),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        unreadCount > 9 ? "9+" : "$unreadCount",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}