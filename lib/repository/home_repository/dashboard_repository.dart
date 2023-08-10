
import 'package:ghar_darshan/data/network/network_api_services.dart';
import 'package:ghar_darshan/models/home/dashboard_model.dart';
import 'package:ghar_darshan/res/app_url/app_url.dart';

class DashboardRepository {
  final _apiService = NetworkApiServices();

  Future<DashboardModel> dashboardDetails(data) async {
    try {
      dynamic response = await _apiService.postApi(data,AppUrl.dashboard);
      return response = DashboardModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}