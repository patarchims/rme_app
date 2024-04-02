import 'dart:convert';

import 'package:hms_app/domain/models/token/token_model.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenPref {
  // Simpan Token ke database lokal
  static Future<void> saveToken({required TokenModel token}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(token.toJson());
    await pref.setString(AppConstant.tokenString, stringUser);
  }

  // Dapatkan Token saat ini yang ada di lokal
  static Future<TokenModel?> getCurrentToken() async {
    TokenModel? token;
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? string = pref.getString(AppConstant.tokenString);
      if (string != null) {
        Map<String, dynamic> mapUser = jsonDecode(string);
        token = TokenModel.fromJson(mapUser);
        return (token);
      }
    } on Error catch (_) {
      return (null);
    }
    return (null);
  }

  static Future<void> deleteToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(AppConstant.tokenString);
  }
}
