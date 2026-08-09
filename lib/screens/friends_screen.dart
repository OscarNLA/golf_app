import 'package:flutter/material.dart';
import 'package:golf_app/widgets/friend_added_card.dart';
import 'package:golf_app/widgets/add_friend_modal.dart';
import 'package:golf_app/widgets/glass_button.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              GlassButton(
                title: "Agregar Amigo",
                icon: Icons.person_add_alt_1,
                onTap: () {
                  showAddFriendModal(context);
                },
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView(
                  children: const [
                    FriendAddedCard(name: "Juan Perez", handicap: "12.4"),
                    SizedBox(height: 16),
                    FriendAddedCard(name: "Carlos Ruiz", handicap: "8.7"),
                    SizedBox(height: 16),
                    FriendAddedCard(name: "Miguel Flores", handicap: "15.2"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
