class DictionModel {
  List<Definitions>? definitions;
  String? word;
  String? pronunciation;

  DictionModel({this.definitions, this.word, this.pronunciation});

  DictionModel.fromJson(Map<String, dynamic> json) {
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add(Definitions.fromJson(v));
      });
    }
    word = json['word'];
    pronunciation = json['pronunciation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (definitions != null) {
      data['definitions'] = definitions!.map((v) => v.toJson()).toList();
    }
    data['word'] = word;
    data['pronunciation'] = pronunciation;
    return data;
  }
}

class Definitions {
  String? type;
  String? definition;
  String? example;
  String? imageUrl;
  String? emoji;

  Definitions(
      {this.type, this.definition, this.example, this.imageUrl, this.emoji});

  Definitions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    definition = json['definition'];
    example = json['example'];
    imageUrl = json['image_url'];
    emoji = json['emoji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['definition'] = definition;
    data['example'] = example;
    data['image_url'] = imageUrl;
    data['emoji'] = emoji;
    return data;
  }
}
