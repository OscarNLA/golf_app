import 'package:flutter/material.dart';
import 'package:golf_app/widgets/glass_button.dart';
import 'package:golf_app/models/game_model.dart';
import 'package:golf_app/screens/players_setup_screen.dart';
import 'package:golf_app/enumbs/game_type.dart';
import 'package:golf_app/enumbs/golf_course.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({super.key});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  // Ahora usamos el enum real del proyecto.
  GameType _selectedMode = GameType.strokePlay;

  int _selectedHoles = 18;

  GolfCourse _selectedCourse = GolfCourse.urubo;

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
                  height: 110,
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
                              "Nueva partida",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "Configurá tu recorrido",
                              textAlign: TextAlign.center,
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
            // CONTENIDO
            // ============================================================

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 40),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // ====================================================
                    // CAMPO
                    // ====================================================

                    _sectionTitle("Campo"),

                    const SizedBox(height: 12),

                    GlassButton(
                      title: _selectedCourseLabel(_selectedCourse),
                      subtitle: _selectedCourseSubtitle(_selectedCourse),
                      icon: Icons.golf_course_rounded,
                      isPrimary: true,
                      onTap: _showCourseSelector,
                    ),

                    const SizedBox(height: 30),

                    // ====================================================
                    // MODALIDAD
                    // ====================================================

                    _sectionTitle("Modalidad"),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _modeButton(
                            title: "Stroke Play",
                            icon: Icons.flag_outlined,
                            mode: GameType.strokePlay,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: _modeButton(
                            title: "Stableford",
                            icon: Icons.analytics_outlined,
                            mode: GameType.nassau,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _modeButton(
                            title: "Match Play",
                            icon: Icons.compare_arrows_rounded,
                            mode: GameType.wolf,
                          ),
                        ),

                        const Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // ====================================================
                    // RECORRIDO
                    // ====================================================

                    _sectionTitle("Recorrido"),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _holesButton(
                            title: "18 hoyos",
                            subtitle: "Recorrido completo",
                            holes: 18,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: _holesButton(
                            title: "9 hoyos",
                            subtitle: "Primera vuelta",
                            holes: 9,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 36),

                    // ====================================================
                    // CONTINUAR
                    // ====================================================

                    _continueButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ======================================================================
  // TÍTULO DE SECCIÓN
  // ======================================================================

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

  // ======================================================================
  // SELECTOR DE MODALIDAD
  // ======================================================================

  Widget _modeButton({
    required String title,
    required IconData icon,
    required GameType mode,
  }) {
    final bool selected = _selectedMode == mode;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMode = mode;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: 78,
        padding: const EdgeInsets.symmetric(horizontal: 14),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          color: selected
              ? const Color(0xFF90C462).withOpacity(.14)
              : Colors.white.withOpacity(.05),

          border: Border.all(
            color: selected
                ? const Color(0xFF90C462).withOpacity(.65)
                : Colors.white.withOpacity(.10),

            width: selected ? 1.4 : 1,
          ),
        ),

        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: selected
                    ? const Color(0xFF90C462).withOpacity(.18)
                    : Colors.white.withOpacity(.06),
              ),

              child: Icon(
                icon,
                color: selected
                    ? const Color(0xFF90C462)
                    : Colors.white.withOpacity(.65),
                size: 19,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: selected
                      ? FontWeight.w600
                      : FontWeight.w500,
                ),
              ),
            ),

            if (selected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF90C462),
                size: 19,
              ),
          ],
        ),
      ),
    );
  }

  // ======================================================================
  // SELECTOR 9 / 18 HOYOS
  // ======================================================================

  Widget _holesButton({
    required String title,
    required String subtitle,
    required int holes,
  }) {
    final bool selected = _selectedHoles == holes;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedHoles = holes;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: 82,
        padding: const EdgeInsets.symmetric(horizontal: 16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          color: selected
              ? const Color(0xFF90C462).withOpacity(.14)
              : Colors.white.withOpacity(.05),

          border: Border.all(
            color: selected
                ? const Color(0xFF90C462).withOpacity(.65)
                : Colors.white.withOpacity(.10),

            width: selected ? 1.4 : 1,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: selected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),

                AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: selected ? 1 : 0,

                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xFF90C462),
                    size: 19,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(.45),
                fontSize: 11.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ======================================================================
  // BOTÓN CONTINUAR
  // ======================================================================

  Widget _continueButton() {
    return GestureDetector(
      onTap: () {
        final game = GameModel(
          id: '',
          gameType: _selectedMode,
          course: _selectedCourse,
          date: DateTime.now(),
          isOpen: true,
          holesCount: _selectedHoles,
          players: const [],
          holes: const [],
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlayersSetupScreen(
              game: game,
            ),
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
              "Continuar",
              style: TextStyle(
                color: Color(0xFF131313),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),

            SizedBox(width: 10),

            Icon(
              Icons.arrow_forward_rounded,
              color: Color(0xFF131313),
              size: 21,
            ),
          ],
        ),
      ),
    );
  }

  // ======================================================================
  // SELECTOR DE CAMPO
  // ======================================================================

  void _showCourseSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: false,

      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1B1B1B),

            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(28),
            ),

            border: Border.all(
              color: Colors.white.withOpacity(.08),
            ),
          ),

          padding: const EdgeInsets.fromLTRB(
            24,
            12,
            24,
            30,
          ),

          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "Seleccionar campo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Elegí dónde vas a jugar",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.50),
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 20),

                _courseOption(
                  name: "Urubó Golf",
                  subtitle: "Santa Cruz · 18 hoyos",
                  icon: Icons.golf_course_rounded,
                  selected: _selectedCourse == GolfCourse.urubo,

                  onTap: () {
                    setState(() {
                      _selectedCourse = GolfCourse.urubo;
                    });

                    Navigator.pop(context);
                  },
                ),

                const SizedBox(height: 10),

                _courseOption(
                  name: "Las Palmas Golf",
                  subtitle: "Santa Cruz",
                  icon: Icons.golf_course_rounded,
                  selected: _selectedCourse == GolfCourse.lasPalmas,

                  onTap: () {
                    setState(() {
                      _selectedCourse = GolfCourse.lasPalmas;
                    });

                    Navigator.pop(context);
                  },
                ),

                const SizedBox(height: 10),

                _courseOption(
                  name: "Country Club",
                  subtitle: "Cochabamba",
                  icon: Icons.golf_course_rounded,
                  selected: _selectedCourse == GolfCourse.countryClub,

                  onTap: () {
                    setState(() {
                      _selectedCourse = GolfCourse.countryClub;
                    });

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ======================================================================
  // OPCIÓN DE CAMPO
  // ======================================================================

  Widget _courseOption({
    required String name,
    required String subtitle,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),

          color: selected
              ? const Color(0xFF90C462).withOpacity(.12)
              : Colors.white.withOpacity(.05),

          border: Border.all(
            color: selected
                ? const Color(0xFF90C462).withOpacity(.60)
                : Colors.white.withOpacity(.08),

            width: selected ? 1.3 : 1,
          ),
        ),

        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: selected
                    ? const Color(0xFF90C462).withOpacity(.16)
                    : Colors.white.withOpacity(.07),
              ),

              child: Icon(
                icon,
                color: selected
                    ? const Color(0xFF90C462)
                    : Colors.white.withOpacity(.65),
                size: 21,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.45),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            if (selected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF90C462),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  // ======================================================================
  // NOMBRE DEL CAMPO
  // ======================================================================

  String _selectedCourseLabel(GolfCourse course) {
    switch (course) {
      case GolfCourse.urubo:
        return "Urubó Golf";

      case GolfCourse.lasPalmas:
        return "Las Palmas Golf";

      case GolfCourse.countryClub:
        return "Country Club";
    }
  }

  // ======================================================================
  // SUBTÍTULO DEL CAMPO
  // ======================================================================

  String _selectedCourseSubtitle(GolfCourse course) {
    switch (course) {
      case GolfCourse.urubo:
        return "Santa Cruz · 18 hoyos";

      case GolfCourse.lasPalmas:
        return "Santa Cruz";

      case GolfCourse.countryClub:
        return "Cochabamba";
    }
  }
}