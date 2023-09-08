import 'package:littlefish/question_three/data/data_sources/character_api_data_source.dart';
import 'package:littlefish/question_three/data/database/dao/characters_dao.dart';
import 'package:littlefish/question_three/data/database/mapper/database_mapper.dart';
import 'package:littlefish/question_three/domain/entities/character.dart';
import 'package:littlefish/question_three/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterApiDataSource dataSource;
  final CharactersDao charactersDao;
  final DatabaseMapper databaseMapper;

  CharacterRepositoryImpl({
    required this.dataSource,
    required this.charactersDao,
    required this.databaseMapper,
  });

  @override
  Future<List<Character>> getCharacters(
      {required int limit, required int page}) async {
    try {
      final dbEntities = await charactersDao.selectAll(
        limit: limit,
        offset: (page * limit) - limit,
      );

      if (dbEntities.isNotEmpty) {
        return databaseMapper.toCharacters(dbEntities);
      }

      final response = await dataSource.getCharacters(page);

      charactersDao.insertAll(
        databaseMapper.toCharacterDbEntities(response.results),
      );
      return response.results;
    } catch (_) {
      rethrow;
    }
  }
}
