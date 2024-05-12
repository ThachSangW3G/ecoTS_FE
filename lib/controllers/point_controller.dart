import 'dart:convert';

import 'package:ecots_frontend/models/points/point.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PointController extends GetxController {
  final String _baseURL = 'https://ecots-be.onrender.com';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var currentPoint = Rx<Point?>(null);

  Future<void> getPointByToken() async {
    final prefs = await _prefs;
    final accessToken = prefs.getString('tokenAccess');

    final uri = Uri.parse('$_baseURL/point/get-user-point?token=$accessToken');

    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        //print(responseData);
        currentPoint.value = Point.fromJson(responseData);
        print(currentPoint.value);
      }
    } catch (e) {}
  }
}
