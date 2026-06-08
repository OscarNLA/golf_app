import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:golf_app/screens/friends_screen.dart';
import 'package:golf_app/screens/games_screen.dart';
import 'package:golf_app/screens/home_screen.dart';
import 'package:golf_app/screens/profile_screen.dart';


class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {

  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const GamesScreen(),
    const FriendsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: pages[selectedIndex],

      bottomNavigationBar: Container(
  margin: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    color: Colors.white.withValues(alpha: .08),
    border: Border.all(
      color: Colors.white.withValues(alpha: .12),
    ),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 200,
        sigmaY: 200,
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(0, 251, 255, 248),
        elevation: 0,
        type: BottomNavigationBarType.fixed,

        currentIndex: selectedIndex,

        selectedItemColor: const Color(0xFF90C462),
        unselectedItemColor: Colors.white54,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.golf_course_outlined),
            label: "Games",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: "Friends",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    ),
  ),
),
    );
  }
}