class DashboardModel {
  String? status;
  int? code;
  String? message;
  BookingDetails? bookingDetails;
  String? name;

  DashboardModel(
      {this.status, this.code, this.message, this.bookingDetails, this.name});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    bookingDetails = json['booking_details'] != null
        ? BookingDetails.fromJson(json['booking_details'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (bookingDetails != null) {
      data['booking_details'] = bookingDetails!.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class BookingDetails {
  String? bamt;
  String? bkngTotal;

  BookingDetails({this.bamt, this.bkngTotal});

  BookingDetails.fromJson(Map<String, dynamic> json) {
    bamt = json['bamt'];
    bkngTotal = json['bkng_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bamt'] = bamt;
    data['bkng_total'] = bkngTotal;
    return data;
  }
}
