import 'package:flutter/foundation.dart';

class Constants {

  /// Avoid Logs on Release
  static void printMessage({required String tag, required String message}){
    if (kDebugMode) {
      print("[$tag 👉🏻] :🔎  $message");
    }
  }
}
