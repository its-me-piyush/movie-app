import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../models/genres_models.dart';

class GenresProvider with ChangeNotifier {
  final List<GenresModel> _trial = [];

  // Future to get geners list from the url
  Future<void> getGeners() async {
    try {
      var response = await http.get(
        Uri.parse(
          '$baseUrl/genre/movie/list?api_key=$apiKey&language=en-US',
        ),
      );

      // decode the response
      var extractedData = json.decode(response.body) as Map<String, dynamic>;

      // extracting the geners list from the http response
      var genersList = extractedData['genres'] as List;

      // storing it in the _trial list for further use
      for (var element in genersList) {
        _trial.add(
          GenresModel(
            id: element['id'],
            name: element['name'],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  // getter for accessing the genres list
  List<GenresModel> get geners {
    return [..._trial];
  }
}
