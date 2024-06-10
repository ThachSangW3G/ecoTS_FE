import 'dart:convert';

import 'package:ecots_frontend/models/achivement_levels/achivement_level.dart';
import 'package:ecots_frontend/models/achivement_results/achivement_result.dart';

import 'package:ecots_frontend/models/achivements/achivement.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AchivementLevelController extends GetxController {
  final String _baseURL = 'https://ecots-be.onrender.com';

  var achivementResultList = Rx<List<AchivementResult>?>(null);

  Future<List<AchivementLevel>> getAchimentLevelByAchivementId(
      Achivement achivement) async {
    final uri = Uri.parse(
        '$_baseURL/achievement/get-achievement-level-by-achievement-id?achievementId=${achivement.id}');

    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        print(jsonData);

        List<AchivementLevel> responseList = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final name = element['name'];
          final description = element['description'];
          final imgUrl = element['imgUrl'];
          final iconUrl = element['iconUrl'];
          final maxIndex = element['maxIndex'];

          final achivementLevel = AchivementLevel(
              id: id,
              name: name,
              description: description,
              imgUrl: imgUrl,
              iconUrl: iconUrl,
              maxIndex: maxIndex,
              achivement: achivement);
          responseList.add(achivementLevel);
        });

        return responseList;
      }

      return [];
    } catch (e) {
      print(e);

      return [];
    }
  }

  Future<void> getAllAchivementResultProgress(int userId) async {
    final uri = Uri.parse(
        '$_baseURL/achievement/result/get-all-achievement-progress?userId=$userId');

    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        print(jsonData);

        List<AchivementResult> responseList = [];
        jsonData.forEach((element) {
          final achievementLevelName = element['achievementLevelName'];
          final achievementLevelId = element['achievementLevelId'];
          final achievementId = element['achievementId'];
          final currentIndex = element['currentIndex'];
          final maxIndex = element['maxIndex'];
          final progress = element['progress'];
          final imgUrl = element['imgUrl'];
          final iconUrl = element['iconUrl'];

          final achivementResult = AchivementResult(
              achievementLevelName: achievementLevelName,
              achievementLevelId: achievementLevelId,
              achievementId: achievementId,
              currentIndex: currentIndex,
              maxIndex: maxIndex,
              progress: progress,
              imgUrl: imgUrl,
              iconUrl: iconUrl);
          responseList.add(achivementResult);
        });

        achivementResultList.value = responseList;

        print("----- Achivement Result List -----");
        print(achivementResultList.value);
        print("-----");
      }
    } catch (e) {
      print(e);
    }
  }
}
