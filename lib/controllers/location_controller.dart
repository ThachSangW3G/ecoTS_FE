import 'dart:convert';

import 'package:ecots_frontend/models/locations/location.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LocationController extends GetxController {
  final String _baseURL = 'https://ecotsbe-production.up.railway.app';

  var locationList = Rx<List<Location>?>(null);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getAllLocations() async {
    final uri = Uri.parse('$_baseURL/location/get-all');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        print(jsonData);
        List<Location> responseLocations = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final description = element['description'];
          final locationName = element['locationName'];
          final typeOfLocation = element['typeOfLocation'];
          final latitude = element['latitude'];
          final longitude = element['longitude'];
          final review = element['review'];

          final location = Location(
              id: id,
              description: description,
              locationName: locationName,
              typeOfLocation: typeOfLocation,
              latitude: latitude,
              longitude: longitude,
              review: review);

          responseLocations.add(location);
        });

        locationList.value = responseLocations;
      }

      print('-----');
      print(locationList.value);
      print('-----');
    } catch (e) {
      print(e);
    }
  }
}
