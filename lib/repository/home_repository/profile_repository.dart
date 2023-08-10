
import 'package:ghar_darshan/data/network/network_api_services.dart';
import 'package:ghar_darshan/models/home/dashboard_model.dart';
import 'package:ghar_darshan/models/home/profile_model.dart';
import 'package:ghar_darshan/res/app_url/app_url.dart';

class ProfileRepository {
  final _apiService = NetworkApiServices();

  Future<ProfileModel> profileDetails(data) async {
    try {
      dynamic response = await _apiService.postApi(data,AppUrl.profile);
      return response = ProfileModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}