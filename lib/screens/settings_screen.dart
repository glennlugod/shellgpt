import 'package:flutter/material.dart';

import '../types/settings.dart';
import '../utils/settings_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _settingsService = SettingsService();
  Settings _settings = Settings();
  final List<String> _models = Settings.models;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _settings = await _settingsService.readSettings();
    setState(() {});
  }

  void _saveSettings() {
    _settingsService.writeSettings(_settings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'API Key'),
              controller: TextEditingController(text: _settings.apiKey),
              onChanged: (value) {
                _settings.apiKey = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Organization ID'),
              controller: TextEditingController(text: _settings.organizationId),
              onChanged: (value) {
                _settings.organizationId = value;
              },
            ),
            DropdownButton<String>(
              value: _settings.selectedModel,
              onChanged: (String? newValue) {
                setState(() {
                  _settings.selectedModel = newValue!;
                });
              },
              items: _models.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
