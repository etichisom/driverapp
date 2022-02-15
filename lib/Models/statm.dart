class Statm {
  bool status;
  String message;
  Data data;

  Statm({this.status, this.message, this.data});

  Statm.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  DriverDetails driverDetails;
  int completeBooking;
  String cashCollection;
  String cashlessCollection;
  String totalBalance;

  Data(
      {this.driverDetails,
        this.completeBooking,
        this.cashCollection,
        this.cashlessCollection,
        this.totalBalance});

  Data.fromJson(Map<String, dynamic> json) {
    driverDetails = json['driver_details'] != null
        ? new DriverDetails.fromJson(json['driver_details'])
        : null;
    completeBooking = json['complete_booking'];
    cashCollection = json['cash_collection'];
    cashlessCollection = json['cashless_collection'];
    totalBalance = json['total_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.driverDetails != null) {
      data['driver_details'] = this.driverDetails.toJson();
    }
    data['complete_booking'] = this.completeBooking;
    data['cash_collection'] = this.cashCollection;
    data['cashless_collection'] = this.cashlessCollection;
    data['total_balance'] = this.totalBalance;
    return data;
  }
}

class DriverDetails {
  String driverFirstName;
  String driverLastName;
  String driverImage;

  DriverDetails({this.driverFirstName, this.driverLastName, this.driverImage});

  DriverDetails.fromJson(Map<String, dynamic> json) {
    driverFirstName = json['driver_first_name'];
    driverLastName = json['driver_last_name'];
    driverImage = json['driver_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_first_name'] = this.driverFirstName;
    data['driver_last_name'] = this.driverLastName;
    data['driver_image'] = this.driverImage;
    return data;
  }
}
