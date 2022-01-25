class Rbook {
  bool status;
  String message;
  List<Data> data;

  Rbook({this.status, this.message, this.data});

  Rbook.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String requestId;
  String requestCustomerId;
  String requestCustomerMobile;
  String requestPickupLatitude;
  String requestPickupLongitude;
  String requestPickupAddress;
  String requestPickupCity;
  String requestDistanceValue;
  String requestDistanceText;
  String requestTimeText;
  String requestTimeValue;
  String requestTotalAmount;
  String requestStoppageCharges;
  String requestHours;
  String requestBasePrice;
  String requestPerKmPrice;
  String requestBusinessHoursPrice;
  String requestNightPrice;
  String requestExtraWaitingPrice;
  String requestUrgentOrderAmount;
  String requestPaymentsMode;
  String requestPaymentsStatus;
  dynamic requestTransactionId;
  String requestPackageWeight;
  String requestPackageType;
  String requestParcelValue;
  String requestOtherDetails;
  String requestStatus;
  String requestCouponDetails;
  String requestCouponAmount;
  String requestCreateAt;
  String requestUpdateAt;
  String requestVehicleId;
  String requestVehicleTimeFree;
  String requestPaymentPay;
  dynamic requestSecurityCharge;
  String requestTypes;
  dynamic bookingSchedule;
  String customerFullName;
  String vehicleName;
  String vehicleImage;
  String packageName;
  String packageImage;
  String packageTypeName;
  String packageTypeImage;
  List<OrderRequestDrop> orderRequestDrop;

  Data(
      {this.requestId,
        this.requestCustomerId,
        this.requestCustomerMobile,
        this.requestPickupLatitude,
        this.requestPickupLongitude,
        this.requestPickupAddress,
        this.requestPickupCity,
        this.requestDistanceValue,
        this.requestDistanceText,
        this.requestTimeText,
        this.requestTimeValue,
        this.requestTotalAmount,
        this.requestStoppageCharges,
        this.requestHours,
        this.requestBasePrice,
        this.requestPerKmPrice,
        this.requestBusinessHoursPrice,
        this.requestNightPrice,
        this.requestExtraWaitingPrice,
        this.requestUrgentOrderAmount,
        this.requestPaymentsMode,
        this.requestPaymentsStatus,
        this.requestTransactionId,
        this.requestPackageWeight,
        this.requestPackageType,
        this.requestParcelValue,
        this.requestOtherDetails,
        this.requestStatus,
        this.requestCouponDetails,
        this.requestCouponAmount,
        this.requestCreateAt,
        this.requestUpdateAt,
        this.requestVehicleId,
        this.requestVehicleTimeFree,
        this.requestPaymentPay,
        this.requestSecurityCharge,
        this.requestTypes,
        this.bookingSchedule,
        this.customerFullName,
        this.vehicleName,
        this.vehicleImage,
        this.packageName,
        this.packageImage,
        this.packageTypeName,
        this.packageTypeImage,
        this.orderRequestDrop});

  Data.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    requestCustomerId = json['request_customer_id'];
    requestCustomerMobile = json['request_customer_mobile'];
    requestPickupLatitude = json['request_pickup_latitude'];
    requestPickupLongitude = json['request_pickup_longitude'];
    requestPickupAddress = json['request_pickup_address'];
    requestPickupCity = json['request_pickup_city'];
    requestDistanceValue = json['request_distance_value'];
    requestDistanceText = json['request_distance_text'];
    requestTimeText = json['request_time_text'];
    requestTimeValue = json['request_time_value'];
    requestTotalAmount = json['request_total_amount'];
    requestStoppageCharges = json['request_stoppage_charges'];
    requestHours = json['request_hours'];
    requestBasePrice = json['request_base_price'];
    requestPerKmPrice = json['request_per_km_price'];
    requestBusinessHoursPrice = json['request_business_hours_price'];
    requestNightPrice = json['request_night_price'];
    requestExtraWaitingPrice = json['request_extra_waiting_price'];
    requestUrgentOrderAmount = json['request_urgent_order_amount'];
    requestPaymentsMode = json['request_payments_mode'];
    requestPaymentsStatus = json['request_payments_status'];
    requestTransactionId = json['request_transaction_id'];
    requestPackageWeight = json['request_package_weight'];
    requestPackageType = json['request_package_type'];
    requestParcelValue = json['request_parcel_value'];
    requestOtherDetails = json['request_other_details'];
    requestStatus = json['request_status'];
    requestCouponDetails = json['request_coupon_details'];
    requestCouponAmount = json['request_coupon_amount'];
    requestCreateAt = json['request_create_at'];
    requestUpdateAt = json['request_update_at'];
    requestVehicleId = json['request_vehicle_id'];
    requestVehicleTimeFree = json['request_vehicle_time_free'];
    requestPaymentPay = json['request_payment_pay'];
    requestSecurityCharge = json['request_security_charge'];
    requestTypes = json['request_types'];
    bookingSchedule = json['booking_schedule'];
    customerFullName = json['customer_full_name'];
    vehicleName = json['vehicle_name'];
    vehicleImage = json['vehicle_image'];
    packageName = json['package_name'];
    packageImage = json['package_image'];
    packageTypeName = json['package_type_name'];
    packageTypeImage = json['package_type_image'];
    if (json['order_request_drop'] != null) {
      orderRequestDrop = new List<OrderRequestDrop>();
      json['order_request_drop'].forEach((v) {
        orderRequestDrop.add(new OrderRequestDrop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.requestId;
    data['request_customer_id'] = this.requestCustomerId;
    data['request_customer_mobile'] = this.requestCustomerMobile;
    data['request_pickup_latitude'] = this.requestPickupLatitude;
    data['request_pickup_longitude'] = this.requestPickupLongitude;
    data['request_pickup_address'] = this.requestPickupAddress;
    data['request_pickup_city'] = this.requestPickupCity;
    data['request_distance_value'] = this.requestDistanceValue;
    data['request_distance_text'] = this.requestDistanceText;
    data['request_time_text'] = this.requestTimeText;
    data['request_time_value'] = this.requestTimeValue;
    data['request_total_amount'] = this.requestTotalAmount;
    data['request_stoppage_charges'] = this.requestStoppageCharges;
    data['request_hours'] = this.requestHours;
    data['request_base_price'] = this.requestBasePrice;
    data['request_per_km_price'] = this.requestPerKmPrice;
    data['request_business_hours_price'] = this.requestBusinessHoursPrice;
    data['request_night_price'] = this.requestNightPrice;
    data['request_extra_waiting_price'] = this.requestExtraWaitingPrice;
    data['request_urgent_order_amount'] = this.requestUrgentOrderAmount;
    data['request_payments_mode'] = this.requestPaymentsMode;
    data['request_payments_status'] = this.requestPaymentsStatus;
    data['request_transaction_id'] = this.requestTransactionId;
    data['request_package_weight'] = this.requestPackageWeight;
    data['request_package_type'] = this.requestPackageType;
    data['request_parcel_value'] = this.requestParcelValue;
    data['request_other_details'] = this.requestOtherDetails;
    data['request_status'] = this.requestStatus;
    data['request_coupon_details'] = this.requestCouponDetails;
    data['request_coupon_amount'] = this.requestCouponAmount;
    data['request_create_at'] = this.requestCreateAt;
    data['request_update_at'] = this.requestUpdateAt;
    data['request_vehicle_id'] = this.requestVehicleId;
    data['request_vehicle_time_free'] = this.requestVehicleTimeFree;
    data['request_payment_pay'] = this.requestPaymentPay;
    data['request_security_charge'] = this.requestSecurityCharge;
    data['request_types'] = this.requestTypes;
    data['booking_schedule'] = this.bookingSchedule;
    data['customer_full_name'] = this.customerFullName;
    data['vehicle_name'] = this.vehicleName;
    data['vehicle_image'] = this.vehicleImage;
    data['package_name'] = this.packageName;
    data['package_image'] = this.packageImage;
    data['package_type_name'] = this.packageTypeName;
    data['package_type_image'] = this.packageTypeImage;
    if (this.orderRequestDrop != null) {
      data['order_request_drop'] =
          this.orderRequestDrop.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderRequestDrop {
  String dropId;
  String dropLatitude;
  String dropLongitude;
  String dropAddress;
  String dropDistanceAddresses;
  String dropCity;
  String dropContactPerson;
  String dropTimeValue;
  String dropTimeText;
  String dropDistanceText;
  String dropDistanceValue;
  String dropRequestId;
  String dropPaymentPay;

  OrderRequestDrop(
      {this.dropId,
        this.dropLatitude,
        this.dropLongitude,
        this.dropAddress,
        this.dropDistanceAddresses,
        this.dropCity,
        this.dropContactPerson,
        this.dropTimeValue,
        this.dropTimeText,
        this.dropDistanceText,
        this.dropDistanceValue,
        this.dropRequestId,
        this.dropPaymentPay});

  OrderRequestDrop.fromJson(Map<String, dynamic> json) {
    dropId = json['drop_id'];
    dropLatitude = json['drop_latitude'];
    dropLongitude = json['drop_longitude'];
    dropAddress = json['drop_address'];
    dropDistanceAddresses = json['drop_distance_addresses'];
    dropCity = json['drop_city'];
    dropContactPerson = json['drop_contact_person'];
    dropTimeValue = json['drop_time_value'];
    dropTimeText = json['drop_time_text'];
    dropDistanceText = json['drop_distance_text'];
    dropDistanceValue = json['drop_distance_value'];
    dropRequestId = json['drop_request_id'];
    dropPaymentPay = json['drop_payment_pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drop_id'] = this.dropId;
    data['drop_latitude'] = this.dropLatitude;
    data['drop_longitude'] = this.dropLongitude;
    data['drop_address'] = this.dropAddress;
    data['drop_distance_addresses'] = this.dropDistanceAddresses;
    data['drop_city'] = this.dropCity;
    data['drop_contact_person'] = this.dropContactPerson;
    data['drop_time_value'] = this.dropTimeValue;
    data['drop_time_text'] = this.dropTimeText;
    data['drop_distance_text'] = this.dropDistanceText;
    data['drop_distance_value'] = this.dropDistanceValue;
    data['drop_request_id'] = this.dropRequestId;
    data['drop_payment_pay'] = this.dropPaymentPay;
    return data;
  }
}
