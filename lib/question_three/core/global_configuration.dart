library global_configuration;

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class GlobalConfiguration {
  Map<String, dynamic> appConfig = <String, dynamic>{};

  Future<void> loadFromPath(String path) async {
    final String content = await rootBundle.loadString(path);
    appConfig.addAll(json.decode(content));
  }

  T tryGetValue<T>(String key, T defaultValue) {
    if (appConfig.containsKey(key)) {
      return appConfig[key] as T;
    }
    return defaultValue;
  }
}
