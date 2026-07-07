import 'dart:ui';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const GlassButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
}
