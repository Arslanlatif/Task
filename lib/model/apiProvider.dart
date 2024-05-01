import 'dart:convert';
import 'package:flutter_application_3/model/VPModelClass.dart';
import 'package:flutter_application_3/model/details_mc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

extension ApiResponse on Response {
  bool isSuccess() => statusCode == 200;
  bool isCreated() => statusCode == 201;
}

Future<DetailsModelClass> fetchDetailsFromApi() async {
  String apiUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=e4391a7b9172d24b19a4d57c52569d62';

  Uri getUrl() => Uri.parse(apiUrl);

  final response = await http.get(getUrl());
  if (response.isSuccess()) {
    return DetailsModelClass.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load details');
  }
}

Future<VPModelClass> fetchVieoFromApi(int movieId) async {
  String apiUrl =
      'https://api.themoviedb.org/3/movie/937287videos?api_key=e4391a7b9172d24b19a4d57c52569d62';

  Uri getUrl() => Uri.parse(apiUrl);

  final response = await http.get(getUrl());
  if (response.isSuccess()) {
    return VPModelClass.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load details');
  }
}
