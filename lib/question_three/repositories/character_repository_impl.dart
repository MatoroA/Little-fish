import 'package:littlefish/question_three/api/data_sources/character_api_data_source.dart';
import 'package:littlefish/question_three/entities/character_response.dart';
import 'package:littlefish/question_three/repositories/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterApiDataSource dataSource;

  CharacterRepositoryImpl({required this.dataSource});

  @override
  Future<CharacterResponse?> getCharacters(String? nextPageKey) async {
    try {
      final response = await dataSource.getCharacters(nextPageKey);
      return response;
    } catch (_) {
      return null;
    }
  }
}
