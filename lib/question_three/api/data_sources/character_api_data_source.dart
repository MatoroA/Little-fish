import 'package:littlefish/question_three/entities/character_response.dart';

abstract class CharacterApiDataSource {
  Future<CharacterResponse?> getCharacters(String? nextPageKey);
}
