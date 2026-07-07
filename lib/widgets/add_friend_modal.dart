import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:golf_app/widgets/search_user_card.dart';

void showAddFriendModal(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: .4),
    builder: (_) => const AddFriendModal(),
  );
}

class AddFriendModal extends StatefulWidget {
  const AddFriendModal({super.key});

  @override
  State<AddFriendModal> createState() => _AddFriendModalState();
}

class _AddFriendModalState extends State<AddFriendModal> {
  final TextEditingController searchController = TextEditingController();

  final users = [
    {"name": "Juan Perez", "handicap": "12.4"},
    {"name": "Carlos Ruiz", "handicap": "8.7"},
    {"name": "Miguel Flores", "handicap": "15.2"},
  ];

  List<Map<String, String>> filteredUsers = [];

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      final query = searchController.text.toLowerCase();

      setState(() {
        if (query.isEmpty) {
          filteredUsers = [];
        } else {
          filteredUsers = users
              .where((user) => user["name"]!.toLowerCase().contains(query))
              .cast<Map<String, String>>()
              .toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            height: 500,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white.withValues(alpha: .12)),
            ),
            child: Column(
              children: [
                const Text(
                  "Agregar Amigos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.white54),
                    hintText: "Buscar jugador...",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: .06),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: filteredUsers.isEmpty
                      ? const Center(
                          child: Text(
                            "Busca un jugador",
                            style: TextStyle(color: Colors.white54),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredUsers.length,
                          itemBuilder: (context, index) {
                            final user = filteredUsers[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: SearchUserCard(
                                name: user["name"]!,
                                handicap: user["handicap"]!,
                              ),
                            );
                          },
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
