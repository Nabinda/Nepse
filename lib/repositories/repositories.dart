import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nepse/model/auth/auth_model.dart';

class UserRepository {
  static String mainUrl = "https://shareapp.minsomai.com.np/v1";
  var loginUrl = '$mainUrl/auth/login';
  // var registerUrl = '$mainUrl/auth/register';
  var registerUrl = 'https://shareapp.minsomai.com.np/v1/auth/register';

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio _dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
      )
  );

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

  Future<dynamic> register(String name, String email, String password) async {
    var data = {
      "name": name,
      "email": email,
      "password": password,
    };

    try {
      Response response = await _dio.post(registerUrl, data: data);
      AuthModel authModel = AuthModel.fromJson(response.data);
      print(authModel.tokens!.access!.token);
      return authModel;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

}