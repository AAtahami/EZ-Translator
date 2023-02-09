// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

Map<String, LanguageModel> languageModelFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, LanguageModel>(k, LanguageModel.fromJson(v)));

String languageModelToJson(Map<String, LanguageModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class LanguageModel {
  LanguageModel(
      {required this.name, required this.nativeName, required this.local});

  final String name;
  final String nativeName;
  final String local;

  factory LanguageModel.fromJson(json) => LanguageModel(
      name: json["name"],
      nativeName: json["nativeName"],
      local: json["locale"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "nativeName": nativeName,
      };
}
