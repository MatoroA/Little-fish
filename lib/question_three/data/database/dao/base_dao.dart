import 'package:flutter/foundation.dart';
import 'package:littlefish/question_three/data/database/entity/character_db_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDao {
  static const databaseVersion = 1;

  static const _databaseName = 'com.my.app.db';

  static const characterTableName = 'characters';

  Database? _database;

  @protected
  Future<Database> getDb() async {
    _database ??= await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createCharacterTable(batch);
        await batch.commit();
      },
      version: databaseVersion,
    );
  }

  void _createCharacterTable(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE $characterTableName(
      ${CharacterDbEntity.fieldId} INTEGER PRIMARY KEY,
      ${CharacterDbEntity.fieldName} TEXT NOT NULL,
      ${CharacterDbEntity.fieldStatus} TEXT NOT NULL,
      ${CharacterDbEntity.fieldSpecies} TEXT NULL,
      ${CharacterDbEntity.fieldType} Text NOT NULL,
      ${CharacterDbEntity.fieldGender} Text NOT NULL,
      ${CharacterDbEntity.fieldImage} Text NOT NULL,
      ${CharacterDbEntity.fieldUrl} Text NOT NULL,
      ${CharacterDbEntity.fieldCreatedDate} INTEGER NOT NULL,
      ${CharacterDbEntity.fieldEpisode} Text NOT NULL,
      ${CharacterDbEntity.fieldOrigin} Text NOT NULL,
      ${CharacterDbEntity.fieldLocation} Text NOT NULL
      );
      ''',
    );
  }
}

