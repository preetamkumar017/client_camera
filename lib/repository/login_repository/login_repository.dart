import 'package:ghar_darshan/data/network/network_api_services.dart';
import 'package:ghar_darshan/models/login/LoginResultModel.dart';
import 'package:ghar_darshan/res/app_url/app_url.dart';

class LoginRepository {

  final _apiService  = NetworkApiServices() ;

  Future<LoginResultModel> loginApi(var data) async{
    try{
      dynamic response = await _apiService.postApi(data, AppUrl.login);
      return response = LoginResultModel.fromJson(response);
    }catch(e)
    {
    rethrow ;
    }
  }



}