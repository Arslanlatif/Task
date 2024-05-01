import 'dart:convert';
import 'package:flutter_application_3/model/details_mc.dart';
import 'package:flutter_application_3/model/env_config.dart';
import 'package:http/http.dart';

extension ApiResponse on Response {
  bool isSuccess() => statusCode == 200;
  bool isCreated() => statusCode == 201;
}

abstract class ApiProvider {
  var baseUrl = 'https://api.themoviedb.org/3/movie/';
  String get apiUrl;
  Uri getUrl() => Uri.parse(baseUrl + apiUrl);
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
  String get apiUrl => 'upcoming?api_key=${EnvConfig.apiKey}';

  Future<List<Results>> fetchMovies() async {
    var listMap = await _fetch() as List;
    return listMap.map((e) => Results.fromJson(e)).toList();
  }
}

// class AlbumApiProvider extends ApiProvider {

//   @override
//   String get apiUrl => '/albums';

// // To Fatch Album
//   Future<List<ModelClass>> fetchAlbums() async {
//     var listMap = await _fetch() as List;
//     return listMap.map((map) => ModelClass.fromMap(map)).toList();
//   }
// }
