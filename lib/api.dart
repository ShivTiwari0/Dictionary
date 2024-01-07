import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tri_api/model.dart';

class Api {
  final String key;

  Api({required this.key});

  Future<List<DiModel>?> getModelApi() async {
    try {
      var url = Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/${key}");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> parsedJson = json.decode(response.body);
        if (parsedJson.isNotEmpty) {
          List<DiModel> models = [];
          for (var item in parsedJson) {
            if (item['word'] != null && item['phonetic'] != null && item['meanings'] != null) {
              DiModel model = DiModel.fromJson(item);
              models.add(model);
            }
          }
          return models.isNotEmpty ? models : null;
        }
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}
