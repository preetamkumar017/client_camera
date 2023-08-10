class LoginResultModel {
  String? status;
  int? code;
  String? message;
  Result? result;

  LoginResultModel({this.status, this.code, this.message, this.result});

  LoginResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? id;
  String? siteId;
  String? siteName;
  String? clientName;
  String? folderName;
  String? dvrIp;
  String? mobile;
  String? password;
  String? status;
  String? createDate;
  String? updateDate;
  String? ip;

  Result(
      {this.id,
        this.siteId,
        this.siteName,
        this.clientName,
        this.folderName,
        this.dvrIp,
        this.mobile,
        this.password,
        this.status,
        this.createDate,
        this.updateDate,
        this.ip});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    siteName = json['site_name'];
    clientName = json['client_name'];
    folderName = json['folder_name'];
    dvrIp = json['dvr_ip'];
    mobile = json['mobile'];
    password = json['password'];
    status = json['status'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_id'] = this.siteId;
    data['site_name'] = this.siteName;
    data['client_name'] = this.clientName;
    data['folder_name'] = this.folderName;
    data['dvr_ip'] = this.dvrIp;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['status'] = this.status;
    data['create_date'] = this.createDate;
    data['update_date'] = this.updateDate;
    data['ip'] = this.ip;
    return data;
  }
}
