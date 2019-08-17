import 'dart:convert';
import 'Quake.dart';
import 'package:http/http.dart' as http;

Future<List<Quake>> getQuakes() async {
  String baseUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(baseUrl);
  final responseJson = json.decode(response.body)["features"];
  print(responseJson);
  List<Quake> quakes;
  List<dynamic> quakesParsed = responseJson.map((json) => Quake.fromJson(json["properties"])).toList();
  quakes = new List<Quake>.from(quakesParsed);
  return quakes;
}
