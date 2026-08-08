import 'package:flutter/material.dart';
import 'package:golf_app/models/friend_model.dart';
import 'package:golf_app/models/game_model.dart';
import 'package:golf_app/models/game_player_model.dart';
import 'package:golf_app/screens/game_summary_screen.dart';

class PlayersSetupScreen extends StatefulWidget {
  final GameModel game;

  const PlayersSetupScreen({
    super.key,
    required this.game,
  });

  @override
  State<PlayersSetupScreen> createState() => _PlayersSetupScreenState();
}

class _PlayersSetupScreenState extends State<PlayersSetupScreen> {
  late GameModel _game;

  // Temporalmente usamos amigos de prueba.
  // Después esto vendrá de UserModel/Firebase.
  final List<FriendModel> _friends = const [
    FriendModel(
      id: "juan",
      fullName: "Juan Pérez",
      photoUrl: "",
      handicap: 8.4,
    ),
    FriendModel(
      id: "pedro",
      fullName: "Pedro Rodríguez",
      photoUrl: "",
      handicap: 12.1,
    ),
    FriendModel(
      id: "miguel",
      fullName: "Miguel Fernández",
      photoUrl: "",
      handicap: 15.7,
    ),
    FriendModel(
      id: "carlos",
      fullName: "Carlos Mendoza",
      photoUrl: "",
      handicap: 10.2,
    ),
    FriendModel(
      id: "luis",
      fullName: "Luis García",
      photoUrl: "",
      handicap: 18.3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _game = widget.game;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),

      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),

          slivers: [
            // ============================================================
            // HEADER
            // ============================================================

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),

              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,

                  child: Stack(
                    children: [
                      // VOLVER

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

                      // TÍTULO

                      Align(
                        alignment: Alignment.topCenter,

                        child: Column(
                          children: [
                            const Text(
                              "Jugadores",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "¿Quiénes van a jugar?",

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
                ),
              ),
            ),

            // ============================================================
            // CONTADOR
            // ============================================================

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),

              sliver: SliverToBoxAdapter(
                child: _playersCounter(),
              ),
            ),

            // ============================================================
            // JUGADORES SELECCIONADOS
            // ============================================================

            if (_game.players.isNotEmpty)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),

                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final player = _game.players[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),

                        child: _selectedPlayerCard(player),
                      );
                    },

                    childCount: _game.players.length,
                  ),
                ),
              ),

            // ============================================================
            // AMIGOS
            // ============================================================

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),

              sliver: SliverToBoxAdapter(
                child: Text(
                  "AGREGAR JUGADORES",

                  style: TextStyle(
                    color: Colors.white.withOpacity(.45),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),

              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final friend = _friends[index];

                    final alreadyAdded = _game.players.any(
                      (player) => player.userId == friend.id,
                    );

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),

                      child: _friendCard(
                        friend,
                        alreadyAdded,
                      ),
                    );
                  },

                  childCount: _friends.length,
                ),
              ),
            ),
          ],
        ),
      ),

      // ================================================================
      // CONTINUAR
      // ================================================================

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),

          child: _continueButton(),
        ),
      ),
    );
  }

  // ======================================================================
  // CONTADOR
  // ======================================================================

  Widget _playersCounter() {
    final count = _game.players.length;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(.05),
        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
      ),

      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF90C462).withOpacity(.12),
            ),

            child: const Icon(
              Icons.groups_rounded,
              color: Color(0xFF90C462),
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "$count / 10 jugadores",

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  count == 0
                      ? "Agregá a los jugadores de la partida"
                      : "Podés agregar hasta 10 jugadores",

                  style: TextStyle(
                    color: Colors.white.withOpacity(.45),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ======================================================================
  // JUGADOR SELECCIONADO
  // ======================================================================

  Widget _selectedPlayerCard(GamePlayerModel player) {
    final friend = _friends.firstWhere(
      (friend) => friend.id == player.userId,
    );

    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

        color: const Color(0xFF90C462).withOpacity(.10),

        border: Border.all(
          color: const Color(0xFF90C462).withOpacity(.30),
        ),
      ),

      child: Row(
        children: [
          _avatar(friend),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  friend.fullName,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  "HCP ${player.handicap.toStringAsFixed(1)}",

                  style: TextStyle(
                    color: Colors.white.withOpacity(.50),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              _removePlayer(player.userId);
            },

            child: Container(
              width: 36,
              height: 36,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.06),
              ),

              child: Icon(
                Icons.close_rounded,
                color: Colors.white.withOpacity(.55),
                size: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ======================================================================
  // AMIGO
  // ======================================================================

  Widget _friendCard(
    FriendModel friend,
    bool alreadyAdded,
  ) {
    final canAdd = _game.players.length < 10;

    return GestureDetector(
      onTap: alreadyAdded || !canAdd
          ? null
          : () => _addPlayer(friend),

      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),

        opacity: alreadyAdded ? .45 : 1,

        child: Container(
          padding: const EdgeInsets.all(14),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),

            color: Colors.white.withOpacity(.05),

            border: Border.all(
              color: Colors.white.withOpacity(.08),
            ),
          ),

          child: Row(
            children: [
              _avatar(friend),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      friend.fullName,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      "HCP ${friend.handicap.toStringAsFixed(1)}",

                      style: TextStyle(
                        color: Colors.white.withOpacity(.45),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                alreadyAdded
                    ? Icons.check_circle_rounded
                    : Icons.add_circle_outline_rounded,

                color: alreadyAdded
                    ? const Color(0xFF90C462)
                    : Colors.white.withOpacity(.45),

                size: 23,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ======================================================================
  // AVATAR
  // ======================================================================

  Widget _avatar(FriendModel friend) {
    return Container(
      width: 46,
      height: 46,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: Colors.white.withOpacity(.08),

        border: Border.all(
          color: Colors.white.withOpacity(.10),
        ),
      ),

      child: friend.photoUrl.isNotEmpty
          ? ClipOval(
              child: Image.network(
                friend.photoUrl,
                fit: BoxFit.cover,
              ),
            )
          : Center(
              child: Text(
                friend.fullName.substring(0, 1).toUpperCase(),

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }

  // ======================================================================
  // AGREGAR
  // ======================================================================

  void _addPlayer(FriendModel friend) {
    if (_game.players.length >= 10) {
      return;
    }

    final player = GamePlayerModel(
      userId: friend.id,
      handicap: friend.handicap,
    );

    setState(() {
      _game = GameModel(
        id: _game.id,
        gameType: _game.gameType,
        course: _game.course,
        date: _game.date,
        isOpen: _game.isOpen,
        holesCount: _game.holesCount,
        players: [
          ..._game.players,
          player,
        ],
        holes: _game.holes,
      );
    });
  }

  // ======================================================================
  // ELIMINAR
  // ======================================================================

  void _removePlayer(String userId) {
    setState(() {
      _game = GameModel(
        id: _game.id,
        gameType: _game.gameType,
        course: _game.course,
        date: _game.date,
        isOpen: _game.isOpen,
        holesCount: _game.holesCount,
        players: _game.players
            .where(
              (player) => player.userId != userId,
            )
            .toList(),
        holes: _game.holes,
      );
    });
  }

  // ======================================================================
  // CONTINUAR
  // ======================================================================

  Widget _continueButton() {
  final enabled = _game.players.isNotEmpty;

  return GestureDetector(
    onTap: enabled
        ? () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GameSummaryScreen(
                  game: _game,
                ),
              ),
            );
          }
        : null,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: enabled
            ? const Color(0xFF90C462)
            : Colors.white.withOpacity(.08),
        boxShadow: enabled
            ? [
                BoxShadow(
                  color: const Color(0xFF90C462).withOpacity(.18),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Continuar",
            style: TextStyle(
              color: enabled
                  ? const Color(0xFF131313)
                  : Colors.white.withOpacity(.30),
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(width: 10),

          Icon(
            Icons.arrow_forward_rounded,
            color: enabled
                ? const Color(0xFF131313)
                : Colors.white.withOpacity(.25),
            size: 21,
          ),
        ],
      ),
    ),
  );
}
}