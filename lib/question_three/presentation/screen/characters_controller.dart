import 'package:littlefish/question_three/entities/character.dart';
import 'package:littlefish/question_three/repositories/character_repository.dart';
import 'package:littlefish/question_three/service_locator.dart';

class CharactersController {
  final _repository = serviceLocator.get<CharacterRepository>();

  // TODO: complete controller impementation
  Future<List<Character>> getCharacters(String? nextPageKey) async {
    final response = await _repository.getCharacters(nextPageKey);
    if (response != null) {
      return response.results;
    }

    return [];
  }
}
