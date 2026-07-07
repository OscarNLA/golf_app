import 'dart:ui';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String date;
  final int players;
  final bool isOpen;
  final VoidCallback? onTap;

  const GameCard({
    super.key,
    required this.title,
    required this.date,
    required this.players,
    required this.isOpen,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor = isOpen
        ? const Color(0xFF6EDB86)
        : const Color(0xFFE85D5D);

    final String status = isOpen ? "ABIERTO" : "CERRADO";

    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withValues(alpha: .12)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .7),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "$players participantes",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .7),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: .15),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: statusColor.withValues(alpha: .45),
                    ),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
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
