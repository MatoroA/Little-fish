import 'package:json_annotation/json_annotation.dart';
import 'package:littlefish/question_three/entities/info.dart';

part 'info_dto.g.dart';

@JsonSerializable()
class InfoDto extends Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  InfoDto({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  }) : super(
          count: count,
          pages: pages,
          next: next,
          prev: prev,
        );

  factory InfoDto.fromJson(Map<String, dynamic> json) =>
      _$InfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoDtoToJson(this);
}
