import 'package:get_it/get_it.dart';
import 'package:littlefish/question_three/api/data_sources/character_api_data_source.dart';
import 'package:littlefish/question_three/api/data_sources/character_api_data_source_impl.dart';
import 'package:littlefish/question_three/core/global_configuration.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;
final _globalConfiguration = GlobalConfiguration();
final _httpClient = http.Client();

void registerServices() async {
  await _loadGlobalConfiguration();
  _registerRepository();
}

Future<void> _loadGlobalConfiguration() async {
  const appSettingsPath = 'configuration/app_settings.json';
  await _globalConfiguration.loadFromPath(appSettingsPath);
  serviceLocator.registerSingleton<GlobalConfiguration>(_globalConfiguration);
}

GlobalConfiguration get config {
  return serviceLocator.get<GlobalConfiguration>();
}

String get baseUrl {
  return config.tryGetValue('baseUrl', '');
}

void _registerRepository() {
  serviceLocator.registerLazySingleton<CharacterApiDataSource>(
    () => CharacterApiDataSourceImpl(
      client: _httpClient,
      baseUrl: baseUrl,
    ),
  );
}
