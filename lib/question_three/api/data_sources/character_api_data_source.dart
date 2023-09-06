import 'package:littlefish/question_three/entities/character.dart';

abstract class CharacterApiDataSource {
  Future<List<Character>> getCharacters(String? nextPageKey);
}
