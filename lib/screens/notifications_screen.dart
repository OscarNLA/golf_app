import 'package:flutter/material.dart';
import 'package:golf_app/models/notification_item.dart';
import 'package:golf_app/repositories/notifications_repository.dart';
import 'package:golf_app/widgets/notification_card.dart';

/// Muestra la pantalla de notificaciones como un panel flotante
/// por encima del contenido actual, en vez de navegar a una ruta nueva.
///
/// Uso: `showNotificationsOverlay(context);`
Future<void> showNotificationsOverlay(BuildContext context) {
  return showGeneralDialog(
    context: context,
    barrierLabel: "Notificaciones",
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: .55),
    transitionDuration: const Duration(milliseconds: 320),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const _NotificationsOverlay();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.06),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}

class _NotificationsOverlay extends StatefulWidget {
  const _NotificationsOverlay();

  @override
  State<_NotificationsOverlay> createState() => _NotificationsOverlayState();
}

class _NotificationsOverlayState extends State<_NotificationsOverlay> {
  @override
  void initState() {
    super.initState();
    NotificationsRepository.instance.addListener(_onRepositoryChanged);
  }

  @override
  void dispose() {
    NotificationsRepository.instance.removeListener(_onRepositoryChanged);
    super.dispose();
  }

  void _onRepositoryChanged() => setState(() {});

  List<NotificationItem> get _notifications =>
      NotificationsRepository.instance.notifications;

  int get _unreadCount => NotificationsRepository.instance.unreadCount;

  void _markAsRead(NotificationItem item) {
    NotificationsRepository.instance.markAsRead(item.id);
  }

  void _markAllAsRead() {
    NotificationsRepository.instance.markAllAsRead();
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: EdgeInsets.only(
          top: topInset + 12,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF131313),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white.withValues(alpha: .1)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _OverlayHeader(
                  unreadCount: _unreadCount,
                  onMarkAllRead: _unreadCount > 0 ? _markAllAsRead : null,
                  onClose: () => Navigator.of(context).pop(),
                ),

                Flexible(
                  child: _notifications.isEmpty
                      ? const _EmptyNotifications()
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                          itemCount: _notifications.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final item = _notifications[index];
                            return _EntranceFade(
                              delay: index * 50,
                              child: NotificationCard(
                                item: item,
                                onTap: () {
                                  _markAsRead(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(item.title),
                                      backgroundColor: const Color(0xFF1E1E1E),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OverlayHeader extends StatelessWidget {
  final int unreadCount;
  final VoidCallback? onMarkAllRead;
  final VoidCallback onClose;

  const _OverlayHeader({
    required this.unreadCount,
    required this.onMarkAllRead,
    required this.onClose,
  });

  static const _accent = Color(0xFF90C462);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: .08)),
        ),
      ),
      child: Row(
        children: [
          Semantics(
            button: true,
            label: "Cerrar notificaciones",
            child: IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            ),
          ),

          const SizedBox(width: 4),

          const Expanded(
            child: Text(
              "Notificaciones",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          if (onMarkAllRead != null)
            TextButton(
              onPressed: onMarkAllRead,
              child: const Text(
                "Marcar todo",
                style: TextStyle(color: _accent, fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyNotifications extends StatelessWidget {
  const _EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_none_rounded,
            size: 56,
            color: Colors.white.withValues(alpha: .35),
          ),
          const SizedBox(height: 16),
          Text(
            "No tienes notificaciones",
            style: TextStyle(color: Colors.white.withValues(alpha: .7)),
          ),
        ],
      ),
    );
  }
}

class _EntranceFade extends StatelessWidget {
  final Widget child;
  final int delay;

  const _EntranceFade({required this.child, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 300 + delay.clamp(0, 350)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 12),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}