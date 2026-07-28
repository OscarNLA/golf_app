import 'package:flutter/material.dart';
import 'package:golf_app/screens/live_game_screen.dart';
import 'package:golf_app/widgets/glass_button.dart';
import 'package:golf_app/widgets/home_silver_header.dart';
import 'package:golf_app/screens/scorecard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const HomeSliverHeader(),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                GlassButton(
                  title: "Nuevo Juego",
                  subtitle: "Iniciá una partida nueva",
                  icon: Icons.add_circle_outline,
                  isPrimary: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ScorecardScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                GlassButton(
                  title: "Unirme a Partida",
                  subtitle: "Sumate con un código",
                  icon: Icons.group_add_outlined,
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                GlassButton(
                  title: "Espectar Partida",
                  subtitle: "Seguí el juego en vivo",
                  icon: Icons.remove_red_eye_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LiveGameScreen()),
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
