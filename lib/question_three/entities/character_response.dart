import 'package:littlefish/question_three/entities/character.dart';
import 'package:littlefish/question_three/entities/info.dart';

class CharacterResponse {
  final Info info;
  final List<Character> results;

  CharacterResponse({
    required this.info,
    required this.results,
  });
}
