import 'dart:convert';
import 'package:flutter_application_3/model/VPModelClass.dart';
import 'package:flutter_application_3/model/details_mc.dart';
import 'package:flutter_application_3/model/env_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

extension ApiResponse on Response {
  bool isSuccess() => statusCode == 200;
  bool isCreated() => statusCode == 201;
}

Future<DetailsModelClass> fetchDetailsFromApi() async {
  String apiKey = EnvConfig.apiKey;

  String apiUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';

  Uri getUrl() => Uri.parse(apiUrl);

  final response = await http.get(getUrl());
  if (response.isSuccess()) {
    return DetailsModelClass.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load details');
  }
}

Future<String?> fetchVideoKeyFromApi({required int id}) async {
  String apiKey = EnvConfig.apiKey;

  String apiUrl =
      'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey';

  Uri getUrl() => Uri.parse(apiUrl);

  final response = await http.get(getUrl());
  if (response.isSuccess()) {
    VPModelClass videoData = VPModelClass.fromJson(jsonDecode(response.body));
    if (videoData.results != null && videoData.results!.isNotEmpty) {
      return videoData.results![0].key;
    } else {
      return null;
    }
  } else {
    throw Exception('Failed to load details');
  }
}
