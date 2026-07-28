import 'package:flutter/material.dart';
import 'package:golf_app/widgets/scorecard/scorecard.dart';

class ScorecardScreen extends StatelessWidget {
  const ScorecardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Nueva Partida"),
      ),
      body: const SafeArea(child: Scorecard()),
    );
  }
}
