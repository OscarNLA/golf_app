import 'package:flutter/material.dart';
import 'package:golf_app/widgets/game_card.dart';
import 'package:golf_app/widgets/silverpageheader.dart';

class _GameEntry {
  final String title;
  final String date;
  final int players;
  final bool isOpen;

  const _GameEntry({
    required this.title,
    required this.date,
    required this.players,
    required this.isOpen,
  });
}

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  static const _cardSpacing = 18.0;
  static const _listPadding = EdgeInsets.fromLTRB(24, 24, 24, 30);

  static const List<_GameEntry> _games = [
    _GameEntry(
      title: "Partida Club La Paz",
      date: "08 Jun 2026",
      players: 12,
      isOpen: true,
    ),
    _GameEntry(
      title: "Torneo Domingo",
      date: "01 Jun 2026",
      players: 18,
      isOpen: false,
    ),
    _GameEntry(
      title: "Golf Friends",
      date: "22 May 2026",
      players: 8,
      isOpen: false,
    ),
    _GameEntry(
      title: "Santa Cruz Golf",
      date: "14 May 2026",
      players: 16,
      isOpen: true,
    ),
    _GameEntry(
      title: "Domingo Familiar",
      date: "07 May 2026",
      players: 10,
      isOpen: false,
    ),
    _GameEntry(
      title: "Copa Primavera",
      date: "30 Abr 2026",
      players: 24,
      isOpen: false,
    ),
    _GameEntry(
      title: "La Paz Invitational",
      date: "12 Abr 2026",
      players: 20,
      isOpen: true,
    ),
  ];

  Future<void> _onRefresh() async {
    // Aquí engancharías la recarga real desde tu fuente de datos.
    await Future.delayed(const Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        backgroundColor: const Color(0xFF1E1E1E),
        color: Colors.white,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            const SliverPageHeader(
              title: "Historial",
              subtitle: "Tus partidas anteriores",
              image: "assets/golf_bg.jpg",
            ),
            if (_games.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: _EmptyState(),
              )
            else
              SliverPadding(
                padding: _listPadding,
                sliver: SliverList.separated(
                  itemCount: _games.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: _cardSpacing),
                  itemBuilder: (context, index) {
                    final game = _games[index];
                    return _AnimatedGameCard(
                      index: index,
                      child: Semantics(
                        label:
                            '${game.title}, ${game.date}, ${game.players} jugadores, '
                            '${game.isOpen ? "partida abierta" : "partida cerrada"}',
                        child: GameCard(
                          title: game.title,
                          date: game.date,
                          players: game.players,
                          isOpen: game.isOpen,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Envuelve cada [GameCard] con una entrada suave y escalonada
/// (fade + slide desde abajo) para que la lista se sienta más viva.
class _AnimatedGameCard extends StatelessWidget {
  final int index;
  final Widget child;

  const _AnimatedGameCard({required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 350 + (index * 60).clamp(0, 400)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 16),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.golf_course_outlined,
            size: 56,
            color: Colors.white.withOpacity(0.35),
          ),
          const SizedBox(height: 16),
          Text(
            "Todavía no tienes partidas registradas",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}