import 'package:http/http.dart' as http;
import 'package:littlefish/question_three/api/data_sources/character_api_data_source.dart';
import 'package:littlefish/question_three/entities/character.dart';
import 'package:path/path.dart' as path;

class CharacterApiDataSourceImpl extends CharacterApiDataSource {
  final http.Client client;
  final String baseUrl;

  CharacterApiDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<Character>> getCharacters(String? nextPageKey) async {
    final url = Uri.parse(getAbsoluteUrl('relativeUrl'));
    final response = await client.get(url);

    return [];
  }

  String getAbsoluteUrl(String relativeUrl) {
    return path.url.join(baseUrl, relativeUrl);
  }
}
