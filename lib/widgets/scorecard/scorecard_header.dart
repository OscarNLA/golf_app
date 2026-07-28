import 'package:flutter/material.dart';

class ScorecardHeader extends StatelessWidget {
  final String course;
  final String gameMode;
  final String date;
  final int players;
  final int currentHole;

  const ScorecardHeader({
    super.key,
    required this.course,
    required this.gameMode,
    required this.date,
    required this.players,
    required this.currentHole,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Campo
          Row(
            children: [
              const Icon(Icons.golf_course, color: Color(0xFF90C462), size: 28),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  course,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          /// Modalidad + Fecha
          Row(
            children: [
              _infoChip(Icons.emoji_events_outlined, gameMode),

              const Spacer(),

              _infoChip(Icons.calendar_today_outlined, date),
            ],
          ),

          const SizedBox(height: 16),

          /// Jugadores + Hoyo actual
          Row(
            children: [
              _infoChip(Icons.people_outline, "$players jugadores"),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF90C462).withValues(alpha: .18),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFF90C462)),
                ),
                child: Text(
                  "Hoyo $currentHole / 18",
                  style: const TextStyle(
                    color: Color(0xFF90C462),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF90C462), size: 18),

          const SizedBox(width: 8),

          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
