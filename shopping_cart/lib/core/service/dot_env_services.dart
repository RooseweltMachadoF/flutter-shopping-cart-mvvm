import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvServices {
  static final DotEnvServices _singleton = DotEnvServices._internal();

  factory DotEnvServices() {
    return _singleton;
  }
  
  DotEnvServices._internal();

  static String get getApiBaseUrl => dotenv.env["API_BASE_URL"] as String;
  
}