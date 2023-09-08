import 'package:littlefish/question_three/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters({
    required int limit,
    required int page,
  });
}
