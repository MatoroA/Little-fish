import 'package:json_annotation/json_annotation.dart';
import 'package:littlefish/question_three/models/location_dto.dart';

part 'character_dto.g.dart';

@JsonSerializable()
class CharacterDto {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationDto origin;
  LocationDto location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  CharacterDto({
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

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDtoToJson(this);
}
