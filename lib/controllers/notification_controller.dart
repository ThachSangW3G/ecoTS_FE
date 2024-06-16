import 'dart:convert';

import 'package:ecots_frontend/models/notifications/notification.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  final String _baseURL = 'https://ecotsbe-production.up.railway.app';
  var notificationList = Rx<List<NotificationModel>?>(null);

  Future<void> getAllNotification(int userId) async {
    final uri = Uri.parse('$_baseURL/api/notifications/user/$userId');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      print(response.statusCode);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        final List<NotificationModel> notifications = [];

        jsonData.forEach((element) {
          final id = element['id'];
          final points = element['points'];
          final exchangePointLocation = element['exchangePointLocation'];
          final userId = element['userId'];
          final DateTime createdAt =
              DateTime.fromMillisecondsSinceEpoch(element['createdAt']);
          final notification = NotificationModel(
            id: id,
            points: points,
            exchangePointLocation: exchangePointLocation,
            userId: userId,
            createdAt: createdAt,
          );

          notifications.add(notification);
        });
        notificationList.value = notifications;
      }
    } catch (e) {
      print(e);
    }
  }
}
