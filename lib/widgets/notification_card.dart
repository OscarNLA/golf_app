import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golf_app/models/notification_item.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback? onTap;

  const NotificationCard({super.key, required this.item, this.onTap});

  static const _accent = Color(0xFF90C462);

  @override
  Widget build(BuildContext context) {
    final unread = !item.isRead;

    return Semantics(
      label:
          '${item.title}, ${item.message}, ${item.time}, '
          '${unread ? "no leída" : "leída"}',
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticFeedback.selectionClick();
            onTap?.call();
          },
          borderRadius: BorderRadius.circular(22),
          splashColor: _accent.withValues(alpha: .08),
          highlightColor: _accent.withValues(alpha: .05),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: unread ? .08 : .04),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Colors.white.withValues(alpha: unread ? .12 : .07),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: unread
                        ? _accent.withValues(alpha: .15)
                        : Colors.white.withValues(alpha: .06),
                  ),
                  child: Icon(
                    item.kind.icon,
                    size: 22,
                    color: unread ? _accent : Colors.white54,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: unread ? Colors.white : Colors.white70,
                                fontSize: 15.5,
                                fontWeight: unread
                                    ? FontWeight.bold
                                    : FontWeight.w600,
                              ),
                            ),
                          ),
                          if (unread) ...[
                            const SizedBox(width: 8),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: _accent,
                              ),
                            ),
                          ],
                        ],
                      ),

                      const SizedBox(height: 4),

                      Text(
                        item.message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .55),
                          fontSize: 13.5,
                          height: 1.35,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        item.time,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .35),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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