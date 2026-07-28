import 'package:flutter/material.dart';

class ScoreCell extends StatelessWidget {
  final String text;

  final double width;
  final double height;

  final bool isHeader;
  final bool isPlayer;
  final bool isCurrentHole;
  final bool isTotal;

  const ScoreCell({
    super.key,
    required this.text,
    this.width = 52,
    this.height = 48,
    this.isHeader = false,
    this.isPlayer = false,
    this.isCurrentHole = false,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    Color background = Colors.white.withValues(alpha: .04);
    Color border = Colors.white.withValues(alpha: .08);
    Color textColor = Colors.white;

    if (isHeader) {
      background = const Color(0xFF90C462);
      border = const Color(0xFF90C462);
    }

    if (isPlayer) {
      background = const Color(0xFF90C462).withValues(alpha: .12);
      border = Colors.transparent;
      textColor = const Color(0xFF90C462);
    }

    if (isCurrentHole) {
      background = const Color(0xFF90C462);
      border = const Color(0xFF90C462);
      textColor = Colors.white;
    }

    if (isTotal) {
      background = Colors.white.withValues(alpha: .08);
      border = Colors.white.withValues(alpha: .15);
    }

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: textColor,
          fontSize: isHeader ? 15 : 14,
          fontWeight: isHeader ? FontWeight.w800 : FontWeight.w600,
          letterSpacing: isHeader ? .5 : 0,
        ),
      ),
    );
  }
}
