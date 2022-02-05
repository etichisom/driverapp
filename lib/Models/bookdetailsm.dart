class Bookdetail {
  bool status;
  String message;
  Data data;

  Bookdetail({this.status, this.message, this.data});

  Bookdetail.fromJson(Map<String, dynamic> json) {
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
  String bookingId;
  String bookingOrderId;
  String bookingCustomerId;
  String bookingPickupAddress;
  String bookingDistanceText;
  String bookingTimeText;
  String bookingTotalAmount;
  String bookingRequestId;
  String bookingPaymentsMode;
  String bookingCreateAt;
  BookingOtherDetails bookingOtherDetails;
  String bookingPickupCity;
  String bookingStatus;
  String bookingDisplayStatus;
  List<BookingStatusHistory> bookingStatusHistory;
  String bookingUpdateAt;
  String bookingPickupLatitude;
  String bookingPickupLongitude;
  String customerFullName;
  String customerDeviceToken;
  String driverFullName;
  var driverDeviceToken;
  String vehicleName;
  String vehicleImage;
  String packageName;
  String packageImage;
  String packageTypeName;
  String packageTypeImage;
  List<BookingsDrop> bookingsDrop;

  Data(
      {this.bookingId,
        this.bookingOrderId,
        this.bookingCustomerId,
        this.bookingPickupAddress,
        this.bookingDistanceText,
        this.bookingTimeText,
        this.bookingTotalAmount,
        this.bookingRequestId,
        this.bookingPaymentsMode,
        this.bookingCreateAt,
        this.bookingOtherDetails,
        this.bookingPickupCity,
        this.bookingStatus,
        this.bookingDisplayStatus,
        this.bookingStatusHistory,
        this.bookingUpdateAt,
        this.bookingPickupLatitude,
        this.bookingPickupLongitude,
        this.customerFullName,
        this.customerDeviceToken,
        this.driverFullName,
        this.driverDeviceToken,
        this.vehicleName,
        this.vehicleImage,
        this.packageName,
        this.packageImage,
        this.packageTypeName,
        this.packageTypeImage,
        this.bookingsDrop});

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingOrderId = json['booking_order_id'];
    bookingCustomerId = json['booking_customer_id'];
    bookingPickupAddress = json['booking_pickup_address'];
    bookingDistanceText = json['booking_distance_text'];
    bookingTimeText = json['booking_time_text'];
    bookingTotalAmount = json['booking_total_amount'];
    bookingRequestId = json['booking_request_id'];
    bookingPaymentsMode = json['booking_payments_mode'];
    bookingCreateAt = json['booking_create_at'];
    bookingOtherDetails = json['booking_other_details'] != null
        ? new BookingOtherDetails.fromJson(json['booking_other_details'])
        : null;
    bookingPickupCity = json['booking_pickup_city'];
    bookingStatus = json['booking_status'];
    bookingDisplayStatus = json['booking_display_status'];
    if (json['booking_status_history'] != null) {
      bookingStatusHistory = new List<BookingStatusHistory>();
      json['booking_status_history'].forEach((v) {
        bookingStatusHistory.add(new BookingStatusHistory.fromJson(v));
      });
    }
    bookingUpdateAt = json['booking_update_at'];
    bookingPickupLatitude = json['booking_pickup_latitude'];
    bookingPickupLongitude = json['booking_pickup_longitude'];
    customerFullName = json['customer_full_name'];
    customerDeviceToken = json['customer_device_token'];
    driverFullName = json['driver_full_name'];
    driverDeviceToken = json['driver_device_token'];
    vehicleName = json['vehicle_name'];
    vehicleImage = json['vehicle_image'];
    packageName = json['package_name'];
    packageImage = json['package_image'];
    packageTypeName = json['package_type_name'];
    packageTypeImage = json['package_type_image'];
    if (json['bookings_drop'] != null) {
      bookingsDrop = new List<BookingsDrop>();
      json['bookings_drop'].forEach((v) {
        bookingsDrop.add(new BookingsDrop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['booking_order_id'] = this.bookingOrderId;
    data['booking_customer_id'] = this.bookingCustomerId;
    data['booking_pickup_address'] = this.bookingPickupAddress;
    data['booking_distance_text'] = this.bookingDistanceText;
    data['booking_time_text'] = this.bookingTimeText;
    data['booking_total_amount'] = this.bookingTotalAmount;
    data['booking_request_id'] = this.bookingRequestId;
    data['booking_payments_mode'] = this.bookingPaymentsMode;
    data['booking_create_at'] = this.bookingCreateAt;
    if (this.bookingOtherDetails != null) {
      data['booking_other_details'] = this.bookingOtherDetails.toJson();
    }
    data['booking_pickup_city'] = this.bookingPickupCity;
    data['booking_status'] = this.bookingStatus;
    data['booking_display_status'] = this.bookingDisplayStatus;
    if (this.bookingStatusHistory != null) {
      data['booking_status_history'] =
          this.bookingStatusHistory.map((v) => v.toJson()).toList();
    }
    data['booking_update_at'] = this.bookingUpdateAt;
    data['booking_pickup_latitude'] = this.bookingPickupLatitude;
    data['booking_pickup_longitude'] = this.bookingPickupLongitude;
    data['customer_full_name'] = this.customerFullName;
    data['customer_device_token'] = this.customerDeviceToken;
    data['driver_full_name'] = this.driverFullName;
    data['driver_device_token'] = this.driverDeviceToken;
    data['vehicle_name'] = this.vehicleName;
    data['vehicle_image'] = this.vehicleImage;
    data['package_name'] = this.packageName;
    data['package_image'] = this.packageImage;
    data['package_type_name'] = this.packageTypeName;
    data['package_type_image'] = this.packageTypeImage;
    if (this.bookingsDrop != null) {
      data['bookings_drop'] = this.bookingsDrop.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingOtherDetails {
  bool withBag;
  bool recipientsSms;
  bool urgentOrder;

  BookingOtherDetails({this.withBag, this.recipientsSms, this.urgentOrder});

  BookingOtherDetails.fromJson(Map<String, dynamic> json) {
    withBag = json['with_bag'];
    recipientsSms = json['recipients_sms'];
    urgentOrder = json['urgent_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['with_bag'] = this.withBag;
    data['recipients_sms'] = this.recipientsSms;
    data['urgent_order'] = this.urgentOrder;
    return data;
  }
}

class BookingStatusHistory {
  String status;
  String displayStatus;
  String remark;
  String date;
  String uniqId;

  BookingStatusHistory(
      {this.status, this.displayStatus, this.remark, this.date, this.uniqId});

  BookingStatusHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    displayStatus = json['display_status'];
    remark = json['remark'];
    date = json['date'];
    uniqId = json['uniq_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['display_status'] = this.displayStatus;
    data['remark'] = this.remark;
    data['date'] = this.date;
    data['uniq_id'] = this.uniqId;
    return data;
  }
}

class BookingsDrop {
  String bookingDropAddress;
  String bookingDropDistanceAddresses;
  String bookingDropLatitude;
  String bookingDropLongitude;
  String bookingDropTimeText;
  String bookingDropDistanceText;
  String bookingDropCity;
  Null bookingDropStatus;
  Null bookingDropDisplayStatus;
  Null bookingDropStatusHistory;
  String bookingDropId;

  BookingsDrop(
      {this.bookingDropAddress,
        this.bookingDropDistanceAddresses,
        this.bookingDropLatitude,
        this.bookingDropLongitude,
        this.bookingDropTimeText,
        this.bookingDropDistanceText,
        this.bookingDropCity,
        this.bookingDropStatus,
        this.bookingDropDisplayStatus,
        this.bookingDropStatusHistory,
        this.bookingDropId});

  BookingsDrop.fromJson(Map<String, dynamic> json) {
    bookingDropAddress = json['booking_drop_address'];
    bookingDropDistanceAddresses = json['booking_drop_distance_addresses'];
    bookingDropLatitude = json['booking_drop_latitude'];
    bookingDropLongitude = json['booking_drop_longitude'];
    bookingDropTimeText = json['booking_drop_time_text'];
    bookingDropDistanceText = json['booking_drop_distance_text'];
    bookingDropCity = json['booking_drop_city'];
    bookingDropStatus = json['booking_drop_status'];
    bookingDropDisplayStatus = json['booking_drop_display_status'];
    bookingDropStatusHistory = json['booking_drop_status_history'];
    bookingDropId = json['booking_drop_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_drop_address'] = this.bookingDropAddress;
    data['booking_drop_distance_addresses'] = this.bookingDropDistanceAddresses;
    data['booking_drop_latitude'] = this.bookingDropLatitude;
    data['booking_drop_longitude'] = this.bookingDropLongitude;
    data['booking_drop_time_text'] = this.bookingDropTimeText;
    data['booking_drop_distance_text'] = this.bookingDropDistanceText;
    data['booking_drop_city'] = this.bookingDropCity;
    data['booking_drop_status'] = this.bookingDropStatus;
    data['booking_drop_display_status'] = this.bookingDropDisplayStatus;
    data['booking_drop_status_history'] = this.bookingDropStatusHistory;
    data['booking_drop_id'] = this.bookingDropId;
    return data;
  }
}
