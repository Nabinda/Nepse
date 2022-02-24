import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nepse/model/auth/auth_model.dart';

class UserRepository {
  static String mainUrl = "https://shareapp.minsomai.com.np/v1";
  var loginUrl = '$mainUrl/auth/login';
  var registerUrl = '$mainUrl/api/auth/register';

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<dynamic> login(String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password,
    });

    AuthModel authModel = AuthModel.fromJson(response.data);
    return authModel;
  }

  Future<String> register(String name, String email, String password) async {
    Response response = await _dio.post(registerUrl, data: {
      "name": name,
      "email": email,
      "password": password,
    });
    return response.data;
  }

}