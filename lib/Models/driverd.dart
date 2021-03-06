class Driverd {
  bool status;
  String message;
  Data data;

  Driverd({this.status, this.message, this.data});

  Driverd.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String driverId;
  String driverFullName;
  var driverUsername;
  String driverFirstName;
  String driverLastName;
  var driverGender;
  var driverDob;
  String driverMobile;
  String driverEmail;
  var driverPassword;
  String driverImage;
  var driverDescription;
  String driverStatus;
  var driverDeviceId;
  var driverDeviceName;
  var driverDeviceType;
  String driverDeviceToken;
  var driverCreateAt;
  String driverUpdateAt;
  String driverVerified;
  String driverOtp;
  var driverReferral;
  String driverReferralBy;
  String driverLoginStatus;
  String driverIsDisable;
  String driverLatitude;
  String driverLongitude;
  var driverRegion;
  var driverEmployeeType;
  String driverReviewsPoints;

  Data(
      {this.driverId,
        this.driverFullName,
        this.driverUsername,
        this.driverFirstName,
        this.driverLastName,
        this.driverGender,
        this.driverDob,
        this.driverMobile,
        this.driverEmail,
        this.driverPassword,
        this.driverImage,
        this.driverDescription,
        this.driverStatus,
        this.driverDeviceId,
        this.driverDeviceName,
        this.driverDeviceType,
        this.driverDeviceToken,
        this.driverCreateAt,
        this.driverUpdateAt,
        this.driverVerified,
        this.driverOtp,
        this.driverReferral,
        this.driverReferralBy,
        this.driverLoginStatus,
        this.driverIsDisable,
        this.driverLatitude,
        this.driverLongitude,
        this.driverRegion,
        this.driverEmployeeType,
        this.driverReviewsPoints});

  Data.fromJson(Map<dynamic, dynamic> json) {
    driverId = json['driver_id'];
    driverFullName = json['driver_full_name'];
    driverUsername = json['driver_username'];
    driverFirstName = json['driver_first_name'];
    driverLastName = json['driver_last_name'];
    driverGender = json['driver_gender'];
    driverDob = json['driver_dob'];
    driverMobile = json['driver_mobile'];
    driverEmail = json['driver_email'];
    driverPassword = json['driver_password'];
    driverImage = json['driver_image'];
    driverDescription = json['driver_description'];
    driverStatus = json['driver_status'];
    driverDeviceId = json['driver_device_id'];
    driverDeviceName = json['driver_device_name'];
    driverDeviceType = json['driver_device_type'];
    driverDeviceToken = json['driver_device_token'];
    driverCreateAt = json['driver_create_at'];
    driverUpdateAt = json['driver_update_at'];
    driverVerified = json['driver_verified'];
    driverOtp = json['driver_otp'];
    driverReferral = json['driver_referral'];
    driverReferralBy = json['driver_referral_by'];
    driverLoginStatus = json['driver_login_status'];
    driverIsDisable = json['driver_is_disable'];
    driverLatitude = json['driver_latitude'];
    driverLongitude = json['driver_longitude'];
    driverRegion = json['driver_region'];
    driverEmployeeType = json['driver_employee_type'];
    driverReviewsPoints = json['driver_reviews_points'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['driver_id'] = this.driverId;
    data['driver_full_name'] = this.driverFullName;
    data['driver_username'] = this.driverUsername;
    data['driver_first_name'] = this.driverFirstName;
    data['driver_last_name'] = this.driverLastName;
    data['driver_gender'] = this.driverGender;
    data['driver_dob'] = this.driverDob;
    data['driver_mobile'] = this.driverMobile;
    data['driver_email'] = this.driverEmail;
    data['driver_password'] = this.driverPassword;
    data['driver_image'] = this.driverImage;
    data['driver_description'] = this.driverDescription;
    data['driver_status'] = this.driverStatus;
    data['driver_device_id'] = this.driverDeviceId;
    data['driver_device_name'] = this.driverDeviceName;
    data['driver_device_type'] = this.driverDeviceType;
    data['driver_device_token'] = this.driverDeviceToken;
    data['driver_create_at'] = this.driverCreateAt;
    data['driver_update_at'] = this.driverUpdateAt;
    data['driver_verified'] = this.driverVerified;
    data['driver_otp'] = this.driverOtp;
    data['driver_referral'] = this.driverReferral;
    data['driver_referral_by'] = this.driverReferralBy;
    data['driver_login_status'] = this.driverLoginStatus;
    data['driver_is_disable'] = this.driverIsDisable;
    data['driver_latitude'] = this.driverLatitude;
    data['driver_longitude'] = this.driverLongitude;
    data['driver_region'] = this.driverRegion;
    data['driver_employee_type'] = this.driverEmployeeType;
    data['driver_reviews_points'] = this.driverReviewsPoints;
    return data;
  }
}
