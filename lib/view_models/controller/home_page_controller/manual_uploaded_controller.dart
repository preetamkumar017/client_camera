import 'dart:developer';

import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:ghar_darshan/data/response/status.dart';
import 'package:ghar_darshan/models/home/manual_image_model.dart';
import 'package:ghar_darshan/repository/home_repository/client_image_repository.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManualUploadedController extends GetxController
{
  RxString clientName = "".obs;
  RxString folderName = "".obs;
  RxString dvrIp = "".obs;
  RxString siteName = "".obs;
  RxString siteId = "".obs;

  RxString imageUrl = "".obs;

  final _myRepo = ClientImageRepository();
  RxString date = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  get getDate=>date.value;
  setDate(date){
    this.date.value = date;
  }


  void addValue() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    folderName.value = sp.getString("folderName")!;
    dvrIp.value = sp.getString("dvr_ip")!;
    siteName.value = sp.getString("siteName")!;
    clientName.value = sp.getString("clientName")!;
  }




  RxString imageName = "".obs;

  final rxRequestStatus = Status.LOADING.obs ;
  final imageDetails  = ManualImageModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setImageDetails(ManualImageModel value) => imageDetails.value = value ;
  void setError(String value) => error.value = value ;


  Future<void> getData(context)
  async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    siteId.value = sp.getString("siteId") ?? "";
    Map<String,String> data = {
      'site_id':siteId.value,
      'date':date.value
    };
    log(data.toString());
    setRxRequestStatus(Status.LOADING);
    _myRepo.getManualUploadedImages(data).then((value){
      log(value.toJson().toString());
      if(value.code==200)
        {

          setImageDetails(value);
        }else if(value.code == 202)
          {
            setImageDetails(ManualImageModel());
            CoolAlert.show(
              context: context,
              type: CoolAlertType.info,
              text: "Please change date for images!",
              title: "Images not available",
            );
          }
      setRxRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });

  }
}