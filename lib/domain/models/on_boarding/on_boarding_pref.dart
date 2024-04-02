import 'dart:convert';

import 'package:hms_app/domain/models/on_boarding/on_boarding_model.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPref {
  static Future<OnBoardingModel?> getOnBoarding() async {
    OnBoardingModel? result;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? string = pref.getString(AppConstant.onBoardingKEY);
    if (string != null) {
      Map<String, dynamic> mapUser = jsonDecode(string);
      result = OnBoardingModel.fromJson(mapUser);
    }
    return result;
  }

  static Future<void> saveOnBoarding(
      {required OnBoardingModel onBoarding}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String string = jsonEncode(onBoarding.toJson());
    await pref.setString(AppConstant.onBoardingKEY, string);
  }
}
