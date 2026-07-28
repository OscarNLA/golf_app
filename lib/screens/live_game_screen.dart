import 'package:flutter/material.dart';
import 'package:golf_app/widgets/scorecard/scorecard.dart';
import 'package:golf_app/widgets/scorecard/scorecard_header.dart';

class LiveGameScreen extends StatelessWidget {
  const LiveGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const ScorecardHeader(
              course: "Urubó Golf",
              gameMode: "Stroke Play",
              date: "08 Jun 2026",
              players: 6,
              currentHole: 7,
            ),

            const Scorecard(),
          ],
        ),
      ),
    );
  }
}
