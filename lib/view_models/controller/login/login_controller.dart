import 'dart:developer';

import 'package:ghar_darshan/data/response/status.dart';
import 'package:ghar_darshan/models/login/LoginResultModel.dart';
import 'package:ghar_darshan/repository/login_repository/login_repository.dart';
import 'package:ghar_darshan/res/routes/routes_name.dart';
import 'package:ghar_darshan/utils/utils.dart';
import 'package:ghar_darshan/view_models/services/box_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  final _api = LoginRepository();

  RxBool emailAddressLoginVisibility = true.obs;
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  RxBool passwordVisibility = false.obs;

  final rxRequestStatus = Status.LOADING.obs ;
  final loginDetails =LoginResultModel().obs ;
  RxBool loading = false.obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setLoginDetails(LoginResultModel value) => loginDetails.value = value ;
  void setError(String value) => error.value = value ;


  void submit()
  {
    loading.value = true;
    Map<String,String> data = <String,String>{};
    if(email.value.text=="")
      {
        Utils.snackBar("Missing Filed", "Please enter Email");
      }else if(password.value.text=="")
        {
          Utils.snackBar("Missing Filed", "Please enter Password");
          }else
          {
            data = {
              "mobile": email.value.text,
              "password": password.value.text
            };
            log(data.toString());
            setRxRequestStatus(Status.LOADING);
            _api.loginApi(data).then((value) async {

              loading.value = false;
              log(value.toJson().toString());
              if(value.code==200)
              {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setBool("isLogin", true);
                sp.setString("token", "value");
                sp.setString("clientName", value.result!.clientName!);
                sp.setString("folderName", value.result!.folderName!);
                sp.setString("siteName", value.result!.siteName!);
                sp.setString("dvr_ip", value.result!.dvrIp!);
                sp.setString("siteId", value.result!.siteId!);

                setLoginDetails(value);
                Get.offAllNamed(RouteName.selectSource);
              }else
                {
                  Utils.snackBar("Login Error", value.message ?? "");
                }

              setRxRequestStatus(Status.COMPLETED);
            }).onError((error, stackTrace) {
              loading.value = false;
              Utils.snackBar("Login Error", error.toString());
              setRxRequestStatus(Status.ERROR);
            });

          }





  }

}