class Incomem {
  bool status;
  String message;
  Data data;

  Incomem({this.status, this.message, this.data});

  Incomem.fromJson(Map<String, dynamic> json) {
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
  String totalIncome;
  String weekIncome;
  String monthIncome;
  List<IncomeHistory> incomeHistory;

  Data(
      {this.totalIncome,
        this.weekIncome,
        this.monthIncome,
        this.incomeHistory});

  Data.fromJson(Map<String, dynamic> json) {
    totalIncome = json['total_income'];
    weekIncome = json['week_income'];
    monthIncome = json['month_income'];
    if (json['income_history'] != null) {
      incomeHistory = new List<IncomeHistory>();
      json['income_history'].forEach((v) {
        incomeHistory.add(new IncomeHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_income'] = this.totalIncome;
    data['week_income'] = this.weekIncome;
    data['month_income'] = this.monthIncome;
    if (this.incomeHistory != null) {
      data['income_history'] =
          this.incomeHistory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IncomeHistory {
  String payYear;
  String yearName;
  List<PayMonths> payMonths;

  IncomeHistory({this.payYear, this.yearName, this.payMonths});

  IncomeHistory.fromJson(Map<String, dynamic> json) {
    payYear = json['pay_year'];
    yearName = json['year_name'];
    if (json['pay_months'] != null) {
      payMonths = new List<PayMonths>();
      json['pay_months'].forEach((v) {
        payMonths.add(new PayMonths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pay_year'] = this.payYear;
    data['year_name'] = this.yearName;
    if (this.payMonths != null) {
      data['pay_months'] = this.payMonths.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PayMonths {
  String payMonth;
  String monthName;
  List<MonthsRecords> monthsRecords;

  PayMonths({this.payMonth, this.monthName, this.monthsRecords});

  PayMonths.fromJson(Map<String, dynamic> json) {
    payMonth = json['pay_month'];
    monthName = json['month_name'];
    if (json['months_records'] != null) {
      monthsRecords = new List<MonthsRecords>();
      json['months_records'].forEach((v) {
        monthsRecords.add(new MonthsRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pay_month'] = this.payMonth;
    data['month_name'] = this.monthName;
    if (this.monthsRecords != null) {
      data['months_records'] =
          this.monthsRecords.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthsRecords {
  String payId;
  String payAmount;
  String payOrderid;
  String payStatus;
  String payStatusHistory;
  String payCreateAt;
  String payUpadteAt;
  String payPaymentMethod;
  var payDeviceType;
  var payDeviceName;
  var payTxnId;
  String payUseFor;
  String bookingOrderId;

  MonthsRecords(
      {this.payId,
        this.payAmount,
        this.payOrderid,
        this.payStatus,
        this.payStatusHistory,
        this.payCreateAt,
        this.payUpadteAt,
        this.payPaymentMethod,
        this.payDeviceType,
        this.payDeviceName,
        this.payTxnId,
        this.payUseFor,
        this.bookingOrderId});

  MonthsRecords.fromJson(Map<String, dynamic> json) {
    payId = json['pay_id'];
    payAmount = json['pay_amount'];
    payOrderid = json['pay_orderid'];
    payStatus = json['pay_status'];
    payStatusHistory = json['pay_status_history'];
    payCreateAt = json['pay_create_at'];
    payUpadteAt = json['pay_upadte_at'];
    payPaymentMethod = json['pay_payment_method'];
    payDeviceType = json['pay_device_type'];
    payDeviceName = json['pay_device_name'];
    payTxnId = json['pay_txn_id'];
    payUseFor = json['pay_use_for'];
    bookingOrderId = json['booking_order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pay_id'] = this.payId;
    data['pay_amount'] = this.payAmount;
    data['pay_orderid'] = this.payOrderid;
    data['pay_status'] = this.payStatus;
    data['pay_status_history'] = this.payStatusHistory;
    data['pay_create_at'] = this.payCreateAt;
    data['pay_upadte_at'] = this.payUpadteAt;
    data['pay_payment_method'] = this.payPaymentMethod;
    data['pay_device_type'] = this.payDeviceType;
    data['pay_device_name'] = this.payDeviceName;
    data['pay_txn_id'] = this.payTxnId;
    data['pay_use_for'] = this.payUseFor;
    data['booking_order_id'] = this.bookingOrderId;
    return data;
  }
}
