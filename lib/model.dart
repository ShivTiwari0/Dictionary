class DiModel {
    String word;
    List<Phonetic> phonetics;
    List<Meaning> meanings;
    License license;
    List<String> sourceUrls;

    DiModel({
        required this.word,
        required this.phonetics,
        required this.meanings,
        required this.license,
        required this.sourceUrls,
    });
   factory DiModel.fromJson(Map<String, dynamic> json) {
    return DiModel(
      word: json['word'] ?? '',
      phonetics: (json['phonetics'] as List<dynamic>?)
          ?.map((item) => Phonetic.fromJson(item))
          .toList() ??
          [],
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((item) => Meaning.fromJson(item))
          .toList() ??
          [],
      license: License.fromJson(json['license'] ?? {}),
      sourceUrls: (json['sourceUrls'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList() ??
          [],
    );
  }

}

class License {
    String name;
    String url;

    License({
        required this.name,
        required this.url,
    });
   factory License.fromJson(Map<String, dynamic> json) {
    return License(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class Meaning {
    String partOfSpeech;
    List<Definition> definitions;
    List<String> synonyms;
    List<String> antonyms;

    Meaning({
        required this.partOfSpeech,
        required this.definitions,
        required this.synonyms,
        required this.antonyms,
    });
    factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      partOfSpeech: json['partOfSpeech'] ?? '',
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((item) => Definition.fromJson(item))
          .toList() ??
          [],
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList() ??
          [],
      antonyms: (json['antonyms'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList() ??
          [],
    );
  }

}

class Definition {
    String definition;
    List<dynamic> synonyms;
    List<dynamic> antonyms;
    String? example;

    Definition({
        required this.definition,
        required this.synonyms,
        required this.antonyms,
        this.example,
    });
    factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json['definition'] ?? '',
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList() ??
          [],
      antonyms: (json['antonyms'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList() ??
          [],
      example: json['example'] ?? null,
    );
  }

}

class Phonetic {
    String audio;
    String? sourceUrl;
    License? license;
    String? text;

    Phonetic({
        required this.audio,
        this.sourceUrl,
        this.license,
        this.text,
    });
    factory Phonetic.fromJson(Map<String, dynamic> json) {
    return Phonetic(
      audio: json['audio'] ?? '',
      sourceUrl: json['sourceUrl'] ?? '',
      license: json['license'] != null ? License.fromJson(json['license']) : null,
      text: json['text'] ?? '',
    );
  }

}
