import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:golf_app/widgets/glass_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 35),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .08),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .12),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF90C462),
                          width: 3,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/profile.jpeg"),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Oscar Landivar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF90C462).withValues(alpha: .15),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color(0xFF90C462)),
                      ),
                      child: const Text(
                        "Handicap 5.2",
                        style: TextStyle(
                          color: Color(0xFF90C462),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(child: _statCard("24", "Amigos")),

                  const SizedBox(width: 18),

                  Expanded(child: _statCard("58", "Partidas")),
                ],
              ),

              const SizedBox(height: 30),

              GlassButton(
                title: "Editar Perfil",
                icon: Icons.edit_outlined,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String value, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withValues(alpha: .12)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF90C462),
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: .75),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
