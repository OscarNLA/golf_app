import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              height: 300,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/golf-ball-grass-field 3.png",
                    fit: BoxFit.cover,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: .2),
                          Colors.black.withValues(alpha: .75),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bienvenido",
                                    style: TextStyle(
                                      color: Colors.white.withValues(
                                        alpha: .85,
                                      ),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  const Text(
                                    "Oscar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF90C462),
                                  width: 2,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/profile.jpeg",
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        const SizedBox(height: 20),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: .08),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: .12),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Partida Jugando",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 6),

                                        Text(
                                          "08 Jun 2026",
                                          style: TextStyle(
                                            color: Colors.white.withValues(
                                              alpha: .7,
                                            ),
                                            fontSize: 13,
                                          ),
                                        ),

                                        const SizedBox(height: 4),

                                        Text(
                                          "12 participantes",
                                          style: TextStyle(
                                            color: Colors.white.withValues(
                                              alpha: .7,
                                            ),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF6EDB86,
                                      ).withValues(alpha: .15),
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: const Color(
                                          0xFF6EDB86,
                                        ).withValues(alpha: .4),
                                      ),
                                    ),
                                    child: const Text(
                                      "ABIERTO",
                                      style: TextStyle(
                                        color: Color(0xFF6EDB86),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ////
            /// OLA
            /// const SizedBox(height: 20),
            const SizedBox(height: 35),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _glassButton(
                    title: "Nuevo Juego",
                    icon: Icons.add_circle_outline,
                    onTap: () {},
                  ),

                  const SizedBox(height: 18),

                  _glassButton(
                    title: "Unirme a Partida",
                    icon: Icons.group_add_outlined,
                    onTap: () {},
                  ),

                  const SizedBox(height: 18),

                  _glassButton(
                    title: "Espectar Partida",
                    icon: Icons.visibility_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _glassButton({
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withValues(alpha: .08),
          border: Border.all(color: Colors.white.withValues(alpha: .15)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Icon(icon, color: const Color(0xFF90C462), size: 30),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white54,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
