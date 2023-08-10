import 'dart:async';
import 'dart:developer';

import 'package:ghar_darshan/view_models/services/box_storage.dart';
import 'package:get/get.dart';
import 'package:ghar_darshan/res/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  Future<void> isLogin() async {

    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool("isLogin");
    log(isLogin.toString());
    if (isLogin == null || !isLogin) {
      Timer(const Duration(seconds: 3),
          () => Get.toNamed(RouteName.preLoginView));
    } else {
      Timer(const Duration(seconds: 3),
          () => Get.toNamed(RouteName.selectSource));
    }
  }
}
