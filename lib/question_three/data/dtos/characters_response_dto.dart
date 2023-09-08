import 'package:json_annotation/json_annotation.dart';
import 'package:littlefish/question_three/data/dtos/character_dto.dart';
import 'package:littlefish/question_three/data/dtos/info_dto.dart';
import 'package:littlefish/question_three/domain/entities/character_response.dart';

part 'characters_response_dto.g.dart';

@JsonSerializable()
class CharactersResponseDto extends CharacterResponse {
  final InfoDto info;
  final List<CharacterDto> results;

  CharactersResponseDto({
    required this.info,
    required this.results,
  }) : super(
          info: info,
          results: results,
        );

  factory CharactersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseDtoToJson(this);
}
