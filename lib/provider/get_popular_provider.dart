import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class GetPopularProvider with ChangeNotifier {
  Future<List> getTvPopular() async {
    try {
      var response = await http.get(
        Uri.parse(
          '$baseUrl/tv/popular?api_key=$apiKey&language=en-US&page=1',
        ),
      );

      // decode the response
      var extractedData = json.decode(response.body) as Map<String, dynamic>;
      // extracting the geners list from the http response
      var tvItemProvider = extractedData['results'] as List;
      return tvItemProvider;
      // storing it in the _trial list for further use

    } catch (e) {
      rethrow;
    }
  }

  Future<List> getMoviePopular() async {
    try {
      var response = await http.get(
        Uri.parse(
          '$baseUrl/movie/popular?api_key=$apiKey&language=en-US&page=1',
        ),
      );

      // decode the response
      var extractedData = json.decode(response.body) as Map<String, dynamic>;
      // extracting the geners list from the http response
      var tvItemProvider = extractedData['results'] as List;
      return tvItemProvider;
      // storing it in the _trial list for further use

    } catch (e) {
      rethrow;
    }
  }
}
