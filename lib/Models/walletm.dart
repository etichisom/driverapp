class Walletm {
  bool status;
  String message;
  dynamic balance;
  dynamic rowCount;
  List<Data> data;

  Walletm({this.status, this.message, this.balance, this.rowCount, this.data});

  Walletm.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    balance = json['balance'];
    rowCount = json['row_count'];
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
    data['balance'] = this.balance;
    data['row_count'] = this.rowCount;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String walletsId;
  String walletsAmount;
  String walletCustomerId;
  String walletsTransactionId;
  String walletsDescription;
  String walletsCreateAt;
  String walletsStatus;
  String walletsTransactionType;

  Data(
      {this.walletsId,
        this.walletsAmount,
        this.walletCustomerId,
        this.walletsTransactionId,
        this.walletsDescription,
        this.walletsCreateAt,
        this.walletsStatus,
        this.walletsTransactionType});

  Data.fromJson(Map<String, dynamic> json) {
    walletsId = json['wallets_id'];
    walletsAmount = json['wallets_amount'];
    walletCustomerId = json['wallet_customer_id'];
    walletsTransactionId = json['wallets_transaction_id'];
    walletsDescription = json['wallets_description'];
    walletsCreateAt = json['wallets_create_at'];
    walletsStatus = json['wallets_status'];
    walletsTransactionType = json['wallets_transaction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallets_id'] = this.walletsId;
    data['wallets_amount'] = this.walletsAmount;
    data['wallet_customer_id'] = this.walletCustomerId;
    data['wallets_transaction_id'] = this.walletsTransactionId;
    data['wallets_description'] = this.walletsDescription;
    data['wallets_create_at'] = this.walletsCreateAt;
    data['wallets_status'] = this.walletsStatus;
    data['wallets_transaction_type'] = this.walletsTransactionType;
    return data;
  }
}
