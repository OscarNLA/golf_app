import 'package:flutter/material.dart';

class SearchUserCard extends StatelessWidget {
  final String name;
  final String handicap;

  const SearchUserCard({super.key, required this.name, required this.handicap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpeg"),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Handicap $handicap",
                  style: TextStyle(color: Colors.white.withValues(alpha: .7)),
                ),
              ],
            ),
          ),

          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFF90C462),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
