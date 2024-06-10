import 'dart:convert';

import 'package:ecots_frontend/models/achivements/achivement.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AchivementController extends GetxController {
  final String _baseURL = 'https://ecots-be.onrender.com';

  var achivementList = Rx<List<Achivement>?>(null);

  Future<void> getAllAchivement() async {
    final uri = Uri.parse('$_baseURL/achievement');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        print(jsonData);
        List<Achivement> responseChivements = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final type = element['type'];

          final achivement = Achivement(id: id, type: type);

          responseChivements.add(achivement);
        });

        achivementList.value = responseChivements;
      }

      print('-----Achivement List-----');
      print(achivementList.value);
      print('-----');
    } catch (e) {
      print(e);
    }
  }
}
