import 'package:shared_preferences/shared_preferences.dart';

import '../types/settings.dart';

class SettingsService {
  Future<Settings> readSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String apiKey = prefs.getString('apiKey') ?? '';
    String organizationId = prefs.getString('organizationId') ?? '';
    String selectedModel =
        prefs.getString('selectedModel') ?? Settings.defaultModel;

    return Settings(
        apiKey: apiKey,
        organizationId: organizationId,
        selectedModel: selectedModel);
  }

  Future<void> writeSettings(Settings settings) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('apiKey', settings.apiKey);
    await prefs.setString('organizationId', settings.organizationId);
    await prefs.setString('selectedModel', settings.selectedModel);
  }
}
