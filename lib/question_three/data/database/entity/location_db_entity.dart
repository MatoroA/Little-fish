import 'package:json_annotation/json_annotation.dart';

part 'location_db_entity.g.dart';

@JsonSerializable()
class LocationDbEntity {
  static const fieldName = 'location_name';
  static const fieldUrl = 'location_url';

  @JsonKey(name: fieldName)
  final String name;
  @JsonKey(name: fieldUrl)
  final String url;

  LocationDbEntity({
    required this.name,
    required this.url,
  });


  factory LocationDbEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationDbEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDbEntityToJson(this);
}
