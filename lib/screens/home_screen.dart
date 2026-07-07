import 'package:flutter/material.dart';
import 'package:golf_app/widgets/glass_button.dart';
import 'package:golf_app/widgets/home_silver_header.dart';

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
                  icon: Icons.add_circle_outline,
                  onTap: () {},
                ),

                const SizedBox(height: 18),

                GlassButton(
                  title: "Unirme a Partida",
                  icon: Icons.group_add_outlined,
                  onTap: () {},
                ),

                const SizedBox(height: 18),

                GlassButton(
                  title: "Espectar Partida",
                  icon: Icons.visibility_outlined,
                  onTap: () {},
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
