import 'package:golf_app/models/player_score_model.dart';

class HoleModel {
  final int number;

  final int par;

  final List<PlayerScoreModel> scores;

  const HoleModel({
    required this.number,
    required this.par,
    required this.scores,
  });
}