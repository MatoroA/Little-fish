import 'package:littlefish/question_three/data/database/dao/base_dao.dart';
import 'package:littlefish/question_three/data/database/entity/character_db_entity.dart';
import 'package:sqflite/sqflite.dart';

class CharactersDao extends BaseDao {
  Future<List<CharacterDbEntity>> selectAll({
    int? limit,
    int? offset,
  }) async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      BaseDao.characterTableName,
      limit: limit,
      offset: offset,
      orderBy: '${CharacterDbEntity.fieldId} ASC',
    );

    return maps.map((e) => CharacterDbEntity.fromJson(e)).toList();
  }

  Future<void> insert(CharacterDbEntity entity) async {
    final Database db = await getDb();
    await db.insert(BaseDao.characterTableName, entity.toJson());
  }

  Future<void> insertAll(List<CharacterDbEntity> entities) async {
    final Database db = await getDb();
    await db.transaction((transaction) async {
      for (final entity in entities) {
        transaction.insert(BaseDao.characterTableName, entity.toJson());
      }
    });
  }

  Future<void> deleteAll() async {
    final Database db = await getDb();
    await db.delete(BaseDao.characterTableName);
  }
}
