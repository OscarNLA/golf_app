import 'dart:ui';
import 'package:flutter/material.dart';

class FriendCard extends StatefulWidget {
  final String name;
  final String handicap;
  final VoidCallback? onTap;
  final bool selected;

  const FriendCard({
    super.key,
    required this.name,
    required this.handicap,
    this.onTap,
    this.selected = false,
  });

  @override
  State<FriendCard> createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {
  bool _pressed = false;

  void _setPressed(bool value) {
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final green = const Color(0xFF90C462);

    final borderColor = widget.selected
        ? green.withOpacity(.55)
        : Colors.white.withOpacity(.14);

    final fillTop = widget.selected
        ? green.withOpacity(.13)
        : Colors.white.withOpacity(.08);

    final fillBottom = widget.selected
        ? green.withOpacity(.05)
        : Colors.white.withOpacity(.03);

    return GestureDetector(
      onTapDown: widget.onTap == null
          ? null
          : (_) => _setPressed(true),
      onTapUp: widget.onTap == null
          ? null
          : (_) {
              _setPressed(false);
              widget.onTap?.call();
            },
      onTapCancel: widget.onTap == null
          ? null
          : () => _setPressed(false),
      child: AnimatedScale(
        scale: _pressed ? .97 : 1,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: borderColor,
              width: widget.selected ? 1.3 : 1,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                fillTop,
                fillBottom,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  _pressed ? .15 : .28,
                ),
                blurRadius: _pressed ? 10 : 22,
                offset: Offset(
                  0,
                  _pressed ? 3 : 10,
                ),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 18,
                sigmaY: 18,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    // ==================================================
                    // AVATAR
                    // ==================================================

                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(
                          widget.selected ? .14 : .08,
                        ),
                        border: Border.all(
                          color: widget.selected
                              ? green.withOpacity(.45)
                              : Colors.white.withOpacity(.12),
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/profile.jpeg"),
                      ),
                    ),

                    const SizedBox(width: 14),

                    // ==================================================
                    // INFO
                    // ==================================================

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                            ),
                          ),

                          const SizedBox(height: 3),

                          Text(
                            "Handicap ${widget.handicap}",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.50),
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // ==================================================
                    // ACTION
                    // ==================================================

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.selected
                            ? green.withOpacity(.18)
                            : Colors.white.withOpacity(.08),
                        border: Border.all(
                          color: widget.selected
                              ? green.withOpacity(.35)
                              : Colors.white.withOpacity(.10),
                        ),
                      ),
                      child: Icon(
                        widget.selected
                            ? Icons.check_rounded
                            : Icons.add_rounded,
                        color: widget.selected
                            ? green
                            : Colors.white.withOpacity(.65),
                        size: 21,
                      ),
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
