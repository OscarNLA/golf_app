import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golf_app/widgets/glass_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _accent = Color(0xFF90C462);
  static const _glassFill = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 35),

              _EntranceFade(
                delay: 0,
                child: _ProfileHeaderCard(accent: _accent),
              ),

              const SizedBox(height: 30),

              _EntranceFade(
                delay: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        value: "24",
                        title: "Amigos",
                        accent: _accent,
                        glassFill: _glassFill,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: _StatCard(
                        value: "58",
                        title: "Partidas",
                        accent: _accent,
                        glassFill: _glassFill,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              _EntranceFade(
                delay: 160,
                child: GlassButton(
                  title: "Editar Perfil",
                  icon: Icons.edit_outlined,
                  onTap: () {
                    HapticFeedback.lightImpact();
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// Tarjeta principal con avatar, nombre y handicap.
class _ProfileHeaderCard extends StatelessWidget {
  final Color accent;

  const _ProfileHeaderCard({required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: .12)),
      ),
      child: Column(
        children: [
          Semantics(
            label: "Foto de perfil de Oscar Landivar",
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: accent, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: accent.withValues(alpha: .25),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/profile.jpeg"),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Oscar Landivar",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Semantics(
            label: "Hándicap actual 5.2",
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: .15),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: accent),
              ),
              child: Text(
                "Handicap 5.2",
                style: TextStyle(color: accent, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tarjeta de estadística con efecto de vidrio esmerilado.
class _StatCard extends StatelessWidget {
  final String value;
  final String title;
  final Color accent;
  final Color glassFill;

  const _StatCard({
    required this.value,
    required this.title,
    required this.accent,
    required this.glassFill,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "$value $title",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: glassFill.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: glassFill.withValues(alpha: .12)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: accent,
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
      ),
    );
  }
}

/// Envuelve a un hijo con una entrada suave (fade + slide) con retraso
/// opcional, para escalonar la aparición de las secciones.
class _EntranceFade extends StatelessWidget {
  final Widget child;
  final int delay;

  const _EntranceFade({required this.child, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + delay),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 14),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}