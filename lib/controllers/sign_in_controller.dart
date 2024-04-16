import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Secure storage

class SignInController {
  final String _baseURL =
      'https://ecots-be.onrender.com'; // Replace with your actual URL
  final _storage = FlutterSecureStorage(); // Secure storage instance

  Future<bool> login(String username, String password) async {
    final uri = Uri.parse('$_baseURL/auth/signin');
    final requestBody = {'username': username, 'password': password};
    final headers = {'Content-Type': 'application/json'};

    try {
      final response =
          await http.post(uri, body: jsonEncode(requestBody), headers: headers);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final String tokenAccess = responseData['tokenAccess'];
        final String tokenRefresh = responseData['tokenRefresh'];
        final int expiresIn = responseData['expiresIn'];
        final int expiresRefreshIn = responseData['expiresRefreshIn'];
        final String role = responseData['role'];

        // Lưu trữ token và thông tin khác nếu cần thiết
        await _storage.write(key: "tokenAccess", value: tokenAccess);
        await _storage.write(key: "tokenRefresh", value: tokenRefresh);
        await _storage.write(key: "expiresIn", value: expiresIn.toString());
        await _storage.write(
            key: "expiresRefreshIn", value: expiresRefreshIn.toString());
        await _storage.write(key: "role", value: role);
        return true;
      } else {
        print('Login failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }
}
