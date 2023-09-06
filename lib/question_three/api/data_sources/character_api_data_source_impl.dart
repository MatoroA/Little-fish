import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:littlefish/question_three/api/data_sources/character_api_data_source.dart';
import 'package:littlefish/question_three/api/dtos/characters_response_dto.dart';
import 'package:littlefish/question_three/entities/character_response.dart';
import 'package:path/path.dart' as path;

class CharacterApiDataSourceImpl extends CharacterApiDataSource {
  final http.Client client;
  final String baseUrl;

  CharacterApiDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<CharacterResponse?> getCharacters(String? nextPageKey) async {
    final url = Uri.parse(getAbsoluteUrl('character'));
    final response = await client.get(url);

    if (response.statusCode == HttpStatus.ok) {
      return CharactersResponseDto.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  String getAbsoluteUrl(String relativeUrl) {
    return path.url.join(baseUrl, relativeUrl);
  }
}
