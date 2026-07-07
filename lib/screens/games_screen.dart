import 'package:flutter/material.dart';
import 'package:golf_app/widgets/game_card.dart';
import 'package:golf_app/widgets/silverpageheader.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverPageHeader(
            title: "Historial",
            subtitle: "Tus partidas anteriores",
            image: "assets/golf_bg.jpg",
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate(const [
                GameCard(
                  title: "Partida Club La Paz",
                  date: "08 Jun 2026",
                  players: 12,
                  isOpen: true,
                ),
                SizedBox(height: 18),

                GameCard(
                  title: "Torneo Domingo",
                  date: "01 Jun 2026",
                  players: 18,
                  isOpen: false,
                ),
                SizedBox(height: 18),

                GameCard(
                  title: "Golf Friends",
                  date: "22 May 2026",
                  players: 8,
                  isOpen: false,
                ),
                SizedBox(height: 18),

                GameCard(
                  title: "Santa Cruz Golf",
                  date: "14 May 2026",
                  players: 16,
                  isOpen: true,
                ),
                SizedBox(height: 18),

                GameCard(
                  title: "Domingo Familiar",
                  date: "07 May 2026",
                  players: 10,
                  isOpen: false,
                ),
                SizedBox(height: 18),

                GameCard(
                  title: "Copa Primavera",
                  date: "30 Abr 2026",
                  players: 24,
                  isOpen: false,
                ),
                SizedBox(height: 18),

                GameCard(
                  title: "La Paz Invitational",
                  date: "12 Abr 2026",
                  players: 20,
                  isOpen: true,
                ),

                SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
