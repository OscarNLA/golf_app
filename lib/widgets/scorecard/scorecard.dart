import 'package:flutter/material.dart';
import 'package:golf_app/widgets/scorecard/score_row.dart';

class Scorecard extends StatelessWidget {
  const Scorecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
      ),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),

        child: Column(
          children: [
            /// Hole
            const ScoreRow(
              title: "Hole",
              isHeader: true,
              values: [
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "OUT",
                "10",
                "11",
                "12",
                "13",
                "14",
                "15",
                "16",
                "17",
                "18",
                "IN",
                "TOTAL",
              ],
            ),

            /// Par
            const ScoreRow(
              title: "Par",
              values: [
                "4",
                "5",
                "3",
                "4",
                "4",
                "5",
                "3",
                "4",
                "4",
                "36",
                "4",
                "4",
                "3",
                "5",
                "4",
                "3",
                "5",
                "4",
                "4",
                "36",
                "72",
              ],
            ),

            /// Handicap
            const ScoreRow(
              title: "HCP",
              values: [
                "11",
                "3",
                "17",
                "1",
                "13",
                "5",
                "15",
                "7",
                "9",
                "",
                "10",
                "8",
                "18",
                "2",
                "12",
                "16",
                "4",
                "6",
                "14",
                "",
                "",
              ],
            ),

            SizedBox(height: 20),

            /// Jugadores
            const ScoreRow(
              title: "Oscar L.",
              isPlayer: true,
              currentHole: 7,
              values: [
                "4",
                "5",
                "3",
                "4",
                "5",
                "4",
                "",
                "",
                "",
                "25",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "0",
                "25",
              ],
            ),

            const ScoreRow(
              title: "Juan P.",
              isPlayer: true,
              values: [
                "5",
                "5",
                "3",
                "4",
                "",
                "",
                "",
                "",
                "",
                "17",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "0",
                "17",
              ],
            ),

            const ScoreRow(
              title: "Pedro R.",
              isPlayer: true,
              values: [
                "4",
                "6",
                "3",
                "5",
                "",
                "",
                "",
                "",
                "",
                "18",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "0",
                "18",
              ],
            ),
          ],
        ),
      ),
    );
  }
}
