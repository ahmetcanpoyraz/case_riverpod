import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Config {
  static String? _apiKey;

  static Future<void> loadConfig() async {
    final String response = await rootBundle.loadString('assets/config.json');
    final data = jsonDecode(response);
    _apiKey = data['apiKey'];
  }

  static String? get apiKey => _apiKey;
}
