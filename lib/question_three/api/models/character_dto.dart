import 'package:json_annotation/json_annotation.dart';
import 'package:littlefish/question_three/api/models/location_dto.dart';
import 'package:littlefish/question_three/entities/character.dart';

part 'character_dto.g.dart';

@JsonSerializable()
class CharacterDto extends Character {
  CharacterDto({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required LocationDto origin,
    required LocationDto location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episode: episode,
          url: url,
          created: created,
        );

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDtoToJson(this);
}
