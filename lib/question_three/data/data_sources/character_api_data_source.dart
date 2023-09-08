import 'package:littlefish/question_three/domain/entities/character_response.dart';

abstract class CharacterApiDataSource {
  Future<CharacterResponse> getCharacters(int nextPageKey);
}
