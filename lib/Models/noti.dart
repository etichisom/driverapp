class Notim {
  bool status;
  String message;
  List<Data> data;

  Notim({this.status, this.message, this.data});

  Notim.fromJson(Map<String, dynamic> json) {
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
  String notificationId;
  String notificationTitle;
  String notificationDescription;
  Null notificationImage;

  Data(
      {this.notificationId,
        this.notificationTitle,
        this.notificationDescription,
        this.notificationImage});

  Data.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationDescription = json['notification_description'];
    notificationImage = json['notification_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_title'] = this.notificationTitle;
    data['notification_description'] = this.notificationDescription;
    data['notification_image'] = this.notificationImage;
    return data;
  }
}
