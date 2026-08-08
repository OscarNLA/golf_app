import 'package:flutter/material.dart';
import 'package:golf_app/models/game_model.dart';
import 'package:golf_app/models/game_player_model.dart';
import 'package:golf_app/enumbs/game_type.dart';
import 'package:golf_app/enumbs/golf_course.dart';
import 'package:golf_app/screens/live_game_screen.dart';

class GameSummaryScreen extends StatelessWidget {
  final GameModel game;

  const GameSummaryScreen({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              sliver: SliverToBoxAdapter(
                child: _buildHeader(context),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _sectionTitle("Resumen"),

                  const SizedBox(height: 12),

                  _buildGameInfo(),

                  const SizedBox(height: 30),

                  _sectionTitle("Jugadores"),

                  const SizedBox(height: 12),

                  _buildPlayers(),

                  const SizedBox(height: 36),

                  _buildStartButton(context),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.07),
                  border: Border.all(
                    color: Colors.white.withOpacity(.10),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const Text(
                  "Revisá tu partida",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Todo listo para empezar",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.50),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INFORMACIÓN DE LA PARTIDA
  // ============================================================

  Widget _buildGameInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(.06),
        border: Border.all(
          color: Colors.white.withOpacity(.10),
        ),
      ),
      child: Column(
        children: [
          _infoRow(
            icon: Icons.golf_course_rounded,
            label: "Campo",
            value: _courseName(game.course),
          ),

          const SizedBox(height: 18),

          _infoRow(
            icon: Icons.flag_outlined,
            label: "Modalidad",
            value: _gameTypeName(game.gameType),
          ),

          const SizedBox(height: 18),

          _infoRow(
            icon: Icons.grid_view_rounded,
            label: "Recorrido",
            value: "${game.holesCount} hoyos",
          ),
        ],
      ),
    );
  }

  Widget _infoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(.07),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF90C462),
            size: 20,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(.50),
              fontSize: 13,
            ),
          ),
        ),

        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // JUGADORES
  // ============================================================

  Widget _buildPlayers() {
    if (game.players.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(.05),
          border: Border.all(
            color: Colors.white.withOpacity(.08),
          ),
        ),
        child: Text(
          "Todavía no hay jugadores agregados.",
          style: TextStyle(
            color: Colors.white.withOpacity(.50),
            fontSize: 14,
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withOpacity(.05),
        border: Border.all(
          color: Colors.white.withOpacity(.09),
        ),
      ),
      child: Column(
        children: [
          for (int i = 0; i < game.players.length; i++) ...[
            _playerRow(game.players[i]),

            if (i < game.players.length - 1)
              Divider(
                height: 1,
                indent: 72,
                color: Colors.white.withOpacity(.07),
              ),
          ],
        ],
      ),
    );
  }

  Widget _playerRow(GamePlayerModel player) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF90C462).withOpacity(.12),
              border: Border.all(
                color: const Color(0xFF90C462).withOpacity(.25),
              ),
            ),
            child: const Icon(
              Icons.person_outline_rounded,
              color: Color(0xFF90C462),
              size: 21,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              player.userId,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Text(
            "HCP ${player.handicap.toStringAsFixed(1)}",
            style: TextStyle(
              color: Colors.white.withOpacity(.50),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTÓN INICIAR
  // ============================================================

  Widget _buildStartButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LiveGameScreen(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF90C462),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF90C462).withOpacity(.20),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Iniciar partida",
              style: TextStyle(
                color: Color(0xFF131313),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),

            SizedBox(width: 10),

            Icon(
              Icons.play_arrow_rounded,
              color: Color(0xFF131313),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TÍTULO
  // ============================================================

  Widget _sectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: Colors.white.withOpacity(.55),
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
      ),
    );
  }

  // ============================================================
  // ENUMS
  // ============================================================

  String _courseName(GolfCourse course) {
    switch (course) {
      case GolfCourse.urubo:
        return "Urubó Golf";

      case GolfCourse.lasPalmas:
        return "Las Palmas Golf";

      case GolfCourse.countryClub:
        return "Country Club";
    }
  }

  String _gameTypeName(GameType type) {
    switch (type) {
      case GameType.strokePlay:
        return "Stroke Play";

      case GameType.nassau:
        return "Nassau";

      case GameType.wolf:
        return "Wolf";
    }
  }
}