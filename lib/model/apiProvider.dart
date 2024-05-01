import 'dart:convert';
import 'package:flutter_application_3/model/details_mc.dart';
 import 'package:http/http.dart';

extension ApiResponse on Response {
  bool isSuccess() => statusCode == 200;
  bool isCreated() => statusCode == 201;
}

abstract class ApiProvider {
  // var baseUrl = 'https://api.themoviedb.org/3/movie/';
  String get apiUrl;
  Uri getUrl() => Uri.parse(apiUrl);
  // String get apiKey;

  _fetch() async {
    try {
      Response response = await get(getUrl());
      if (response.isSuccess()) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}

class UpcomingMoviesApiProvider extends ApiProvider {
  @override
  String get apiUrl =>
      'https://api.themoviedb.org/3/movie/upcoming?api_key=e4391a7b9172d24b19a4d57c52569d62';

  Future<List<Results>> fetchMovies() async {
    var listMap = await _fetch() as List;
    return listMap.map((e) => Results.fromJson(e)).toList();
  }
}
