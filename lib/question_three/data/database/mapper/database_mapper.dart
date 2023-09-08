import 'package:littlefish/question_three/data/database/entity/character_db_entity.dart';
import 'package:littlefish/question_three/data/database/entity/location_db_entity.dart';
import 'package:littlefish/question_three/domain/entities/character.dart';
import 'package:littlefish/question_three/domain/entities/location.dart';

abstract class DatabaseMapper {
  DatabaseMapper();

  Character toCharacter(CharacterDbEntity entity);

  List<Character> toCharacters(List<CharacterDbEntity> entities);

  CharacterDbEntity toCharacterDbEntity(Character character);

  List<CharacterDbEntity> toCharacterDbEntities(List<Character> characters);

  LocationDbEntity toLocationDbEntity(Location location);

  Location toLocation(LocationDbEntity location);

  Location locationFromString(String str);

}
