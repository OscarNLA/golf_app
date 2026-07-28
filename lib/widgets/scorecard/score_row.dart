import 'package:flutter/material.dart';
import 'package:golf_app/widgets/scorecard/score_cell.dart';

class ScoreRow extends StatelessWidget {
  final String title;
  final List<String> values;

  final bool isHeader;
  final bool isPlayer;
  final int? currentHole;

  const ScoreRow({
    super.key,
    required this.title,
    required this.values,
    this.isHeader = false,
    this.isPlayer = false,
    this.currentHole,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          ScoreCell(
            text: title,
            width: 140,
            isHeader: isHeader,
            isPlayer: isPlayer,
          ),

          ...List.generate(values.length, (index) {
            final value = values[index];

            return ScoreCell(
              text: value,
              isHeader: isHeader,
              isCurrentHole: currentHole == index + 1,
              isTotal:
                  value == "OUT" ||
                  value == "IN" ||
                  value == "TOTAL" ||
                  value == "36" ||
                  value == "72",
            );
          }),
        ],
      ),
    );
  }
}
