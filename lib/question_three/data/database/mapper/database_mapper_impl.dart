import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:littlefish/question_three/data/database/entity/character_db_entity.dart';
import 'package:littlefish/question_three/data/database/entity/location_db_entity.dart';
import 'package:littlefish/question_three/data/database/mapper/database_mapper.dart';
import 'package:littlefish/question_three/domain/entities/character.dart';
import 'package:littlefish/question_three/domain/entities/location.dart';

class DatabaseMapperImpl extends DatabaseMapper {
  DatabaseMapperImpl();

  @override
  Character toCharacter(CharacterDbEntity entity) {
    try {
      return Character(
        id: entity.id,
        name: entity.name,
        status: entity.status,
        species: entity.species,
        type: entity.type,
        gender: entity.gender,
        origin: locationFromString(entity.origin),
        location: locationFromString(entity.location),
        image: entity.image,
        episode: listFromString(entity.episode),
        url: entity.url,
        created: DateTime.fromMillisecondsSinceEpoch(entity.created),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  List<Character> toCharacters(List<CharacterDbEntity> entities) {
    final List<Character> characters = [];

    for (final entity in entities) {
      try {
        characters.add(toCharacter(entity));
      } catch (e) {}
    }

    return characters;
  }

  @override
  CharacterDbEntity toCharacterDbEntity(Character character) {
    try {
      return CharacterDbEntity(
        id: character.id,
        name: character.name,
        status: character.status,
        species: character.species,
        gender: character.gender,
        image: character.image,
        type: character.type,
        url: character.url,
        episode: jsonEncode(character.episode),
        origin: jsonEncode(toLocationDbEntity(character.origin).toJson()),
        location: jsonEncode(toLocationDbEntity(character.location).toJson()),
        created: character.created.millisecondsSinceEpoch,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  List<CharacterDbEntity> toCharacterDbEntities(List<Character> characters) {
    final List<CharacterDbEntity> entities = [];

    for (final character in characters) {
      try {
        entities.add(toCharacterDbEntity(character));
      } catch (e) {
        debugPrint('Could not map character ${character.id}');
      }
    }

    return entities;
  }

  @override
  LocationDbEntity toLocationDbEntity(Location location) {
    return LocationDbEntity(name: location.name, url: location.url);
  }

  @override
  Location toLocation(LocationDbEntity location) {
    return Location(name: location.name, url: location.url);
  }

  @override
  Location locationFromString(String str) {
    final locationDb = LocationDbEntity.fromJson(jsonDecode(str));

    return toLocation(locationDb);
  }

  List<String> listFromString(String str) {
    return List<String>.from(jsonDecode(str));
  }
}
