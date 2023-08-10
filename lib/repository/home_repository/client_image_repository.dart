import 'dart:developer';

import 'package:ghar_darshan/data/network/network_api_services.dart';
import 'package:ghar_darshan/models/home/manual_image_model.dart';
import 'package:ghar_darshan/res/app_url/app_url.dart';

class ClientImageRepository
{
  final NetworkApiServices _apiServices = NetworkApiServices();


  Future<ManualImageModel> getManualUploadedImages(Map data)async {
    // log("getManualUploadedImages${data.toString()}");

    try {
      dynamic response = await _apiServices.postApi(data,AppUrl.manualUploadedImage);
      return response = ManualImageModel.fromJson(response);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}