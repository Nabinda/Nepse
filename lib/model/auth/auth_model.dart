import 'package:nepse/model/auth/tokens_model.dart';
import 'package:nepse/model/user/user_model.dart';

import 'access_model.dart';

class AuthModel {
  User? user;
  Tokens? tokens;

  AuthModel({this.user, this.tokens});

  AuthModel.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    tokens = Tokens.fromJson(json['tokens']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user!= null) {
      data['user'] = user!.toJson();
    }
    if (tokens != null) {
      data['tokens'] = tokens!.toJson();
    }
    return data;
  }
}
