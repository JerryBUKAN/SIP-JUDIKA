// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  final String _baseUrl =
      'http://127.0.0.1:5000/api';
  Future<User?> login(
      String username, String password, String? userType) async {
    try {
      dynamic response;
      if (userType == 'Mahasiswa') {
        response = await http.post(
          Uri.parse('$_baseUrl/mahasiswa/login'),
          body: {'username': username, 'password': password},
        );
      } else if (userType == 'Dosen') {
        response = await http.post(
          Uri.parse('$_baseUrl/dosen/login'),
          body: {'username': username, 'password': password},
        );
      } else if (userType == 'Admin') {
        response = await http.post(
          Uri.parse('$_baseUrl/user/login'),
          body: {'username': username, 'password': password},
        );
      }

      print(await response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = User.fromJson(data['data']);

        // Simpan data user di SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('user', jsonEncode(user.toJson()));

        return user;
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> getLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');

    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    }
    return null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}
