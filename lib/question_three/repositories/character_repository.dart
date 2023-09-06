import 'package:littlefish/question_three/entities/character_response.dart';

abstract class CharacterRepository {
  Future<CharacterResponse?> getCharacters(String? nextPageKey);
}
