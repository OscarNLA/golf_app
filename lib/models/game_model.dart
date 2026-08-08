import 'package:golf_app/enumbs/game_type.dart';
import 'package:golf_app/enumbs/golf_course.dart';
import 'package:golf_app/models/game_player_model.dart';
import 'package:golf_app/models/hole_model.dart';

class GameModel {
  final String id;
  final GameType gameType;
  final GolfCourse course;
  final DateTime date;
  final bool isOpen;
  final int holesCount;
  final List<GamePlayerModel> players;
  final List<HoleModel> holes;

  const GameModel({
    required this.id,
    required this.gameType,
    required this.course,
    required this.date,
    required this.isOpen,
    required this.holesCount,
    required this.players,
    required this.holes,
  });
}
