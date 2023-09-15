import 'package:task_flutter_test/app/utils/base/app/config_reader.dart';

class ApiConstant {
  static String baseUrl = ConfigReader.getBaseUrl();

  static const loginAPI = 'auth/login/';
  static const updateAPI = 'user/update_user/';

}