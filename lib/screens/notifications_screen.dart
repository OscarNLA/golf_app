import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Notificaciones"),
      ),
      body: const Center(
        child: Text(
          "No tienes notificaciones",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
