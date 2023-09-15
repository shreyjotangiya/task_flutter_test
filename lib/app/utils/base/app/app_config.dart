
import 'config_reader.dart';

class AppConfig {

  String getBaseUrl() {
    return ConfigReader.getBaseUrl();
  }

  bool get isDevelopmentEnv => ConfigReader.environment == "dev";
}
