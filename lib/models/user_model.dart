class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String photoUrl;
  final double handicap;

  final List<String> friends;
  final List<String> activeGames;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.photoUrl,
    required this.handicap,
    required this.friends,
    required this.activeGames,
  });
}
