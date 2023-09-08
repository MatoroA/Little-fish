import 'package:json_annotation/json_annotation.dart';
import 'package:littlefish/question_three/domain/entities/location.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto extends Location {
  LocationDto({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  // Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}
