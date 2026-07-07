import 'package:flutter/material.dart';

class SliverPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  final double expandedHeight;

  /// Widget opcional debajo del subtítulo
  final Widget? bottom;

  /// Widget opcional arriba a la derecha
  final Widget? trailing;

  const SliverPageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.expandedHeight = 240,
    this.bottom,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xFF131313),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: false,
      floating: false,
      automaticallyImplyLeading: false,
      expandedHeight: expandedHeight,

      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: .15),
                    Colors.black.withValues(alpha: .88),
                  ],
                ),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (trailing != null)
                      Align(alignment: Alignment.topRight, child: trailing!),

                    const Spacer(),

                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: .75),
                        fontSize: 16,
                      ),
                    ),

                    if (bottom != null) ...[
                      const SizedBox(height: 20),
                      bottom!,
                    ],
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
