import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:golf_app/widgets/notification_button.dart';

class HomeSliverHeader extends StatelessWidget {
  const HomeSliverHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF131313),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: false,
      floating: false,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/golf-ball-grass-field 3.png",
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: .15),
                    Colors.black.withValues(alpha: .85),
                  ],
                ),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 1, 24, 24),
                child: Column(
                  children: [
                    /// Top Bar
                    Row(
                      children: [
                        const NotificationButton(),

                        const Spacer(),

                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF90C462),
                              width: 2,
                            ),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage("assets/profile.jpeg"),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    /// Welcome
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenido",
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: .85),
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            "Oscar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// Current Game Card
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .08),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: .12),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Partida Jugando",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      "08 Jun 2026",
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: .7,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      "12 participantes",
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: .7,
                                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
