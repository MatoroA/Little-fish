import 'package:json_annotation/json_annotation.dart';

part 'character_db_entity.g.dart';

@JsonSerializable()
class CharacterDbEntity {
  static const fieldId = 'character_id';
  static const fieldName = 'character_name';
  static const fieldStatus = 'character_status';
  static const fieldSpecies = 'character_species';
  static const fieldType = 'character_type';
  static const fieldGender = 'character_gender';
  static const fieldOrigin = 'character_origin';
  static const fieldLocation = 'character_location';
  static const fieldImage = 'character_image';
  static const fieldEpisode = 'character_episode';
  static const fieldUrl = 'character_url';
  static const fieldCreatedDate = 'character_created_date';

  @JsonKey(name: fieldId)
  final int id;
  @JsonKey(name: fieldName)
  final String name;
  @JsonKey(name: fieldStatus)
  final String status;
  @JsonKey(name: fieldSpecies)
  final String species;
  @JsonKey(name: fieldType)
  final String type;
  @JsonKey(name: fieldGender)
  final String gender;
  @JsonKey(name: fieldOrigin)
  final String origin;
  @JsonKey(name: fieldLocation)
  final String location;
  @JsonKey(name: fieldImage)
  final String image;
  @JsonKey(name: fieldEpisode)
  final String episode;
  @JsonKey(name: fieldUrl)
  final String url;
  @JsonKey(name: fieldCreatedDate)
  final int created;

  CharacterDbEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterDbEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterDbEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDbEntityToJson(this);
}
