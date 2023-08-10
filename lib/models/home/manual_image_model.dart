class ManualImageModel {
  String? status;
  int? code;
  String? message;
  List<Result>? result;

  ManualImageModel({this.status, this.code, this.message, this.result});

  ManualImageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  List<String>? imageList;
  String? createDate;
  String? remark;
  String? id;

  Result({this.imageList, this.createDate, this.remark, this.id});

  Result.fromJson(Map<String, dynamic> json) {
    imageList = json['image_list'].cast<String>();
    createDate = json['create_date'];
    remark = json['remark'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_list'] = this.imageList;
    data['create_date'] = this.createDate;
    data['remark'] = this.remark;
    data['id'] = this.id;
    return data;
  }
}
