class Settings {
  String apiKey;
  String organizationId;
  String selectedModel;

  static const String _defaultModel = 'gpt-4-1106-preview';

  static const List<String> _myModelList = [
    _defaultModel,
    'gpt-4-vision-preview',
    'gpt-4',
    'gpt-4-32k',
    'gpt-4-0613',
    'gpt-4-32k-0613',
    'gpt-3.5-turbo-1106',
    'gpt-3.5-turbo',
    'gpt-3.5-turbo-16k',
    'gpt-3.5-turbo-instruct'
  ];

  static String get defaultModel {
    return _defaultModel;
  }

  // A static getter to return the list of strings
  static List<String> get models {
    return _myModelList;
  }

  Settings(
      {this.apiKey = '',
      this.organizationId = '',
      this.selectedModel = _defaultModel});

  // Convert a Settings object into a Map. The keys must correspond to the names of the
  // JSON attributes in your settings file.
  Map<String, dynamic> toJson() => {
        'apiKey': apiKey,
        'organizationId': organizationId,
        'selectedModel': selectedModel,
      };

  // A method to convert a map (from JSON) into a Settings instance
  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        apiKey: json['apiKey'],
        organizationId: json['organizationId'],
        selectedModel: json['selectedModel'],
      );
}
