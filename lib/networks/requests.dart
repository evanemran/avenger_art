import 'dart:convert';
import 'package:avenger_art/models/avenger.dart';
import '../constants/app_strings.dart';
import 'package:http/http.dart' as http;

class Requests {
  Future<List<Avenger>> getAllAvengers() async {
    final uri = Uri.parse(AppStrings.baseUrl + AppStrings.allAvengers);
    final response = await http.get(uri);

    if (response.statusCode == 200) {

      List<dynamic> jsonList = json.decode(response.body);
      List<Avenger> avengers = jsonList.map((json) => Avenger.fromJson(json)).toList();

      return avengers;
    }
    else {
      throw Exception('Failed to connect!');
    }
  }

  Future<List<Avenger>> getRandomAvenger() async {
    final uri = Uri.parse(AppStrings.baseUrl + AppStrings.randomAvengers);
    final response = await http.get(uri);

    if (response.statusCode == 200) {

      List<dynamic> jsonList = json.decode(response.body);
      List<Avenger> avengers = jsonList.map((json) => Avenger.fromJson(json)).toList();

      return avengers;
    }
    else {
      throw Exception('Failed to connect!');
    }
  }
}