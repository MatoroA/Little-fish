import 'package:get_it/get_it.dart';
import 'package:littlefish/question_three/api/data_sources/character_api_data_source.dart';
import 'package:littlefish/question_three/api/data_sources/character_api_data_source_impl.dart';
import 'package:littlefish/question_three/core/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:littlefish/question_three/repositories/character_repository.dart';
import 'package:littlefish/question_three/repositories/character_repository_impl.dart';

final serviceLocator = GetIt.instance;
final _globalConfiguration = GlobalConfiguration();
final _httpClient = http.Client();

Future<void> registerServices() async {
  await _loadGlobalConfiguration();
  _registerDatasource();
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

void _registerDatasource() {
  serviceLocator.registerLazySingleton<CharacterApiDataSource>(
    () => CharacterApiDataSourceImpl(
      client: _httpClient,
      baseUrl: baseUrl,
    ),
  );
}

void _registerRepository() {
  serviceLocator.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      dataSource: serviceLocator.get<CharacterApiDataSource>(),
    ),
  );
}
