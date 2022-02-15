class Photoday {
  bool status;
  String message;
  Data data;

  Photoday({this.status, this.message, this.data});

  Photoday.fromJson(Map<String, dynamic> json) {
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
  String photoId;
  String photoPath;
  String photoCreateAt;
  String photoUpdateAt;
  String photoDriverId;

  Data(
      {this.photoId,
        this.photoPath,
        this.photoCreateAt,
        this.photoUpdateAt,
        this.photoDriverId});

  Data.fromJson(Map<String, dynamic> json) {
    photoId = json['photo_id'];
    photoPath = json['photo_path'];
    photoCreateAt = json['photo_create_at'];
    photoUpdateAt = json['photo_update_at'];
    photoDriverId = json['photo_driver_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo_id'] = this.photoId;
    data['photo_path'] = this.photoPath;
    data['photo_create_at'] = this.photoCreateAt;
    data['photo_update_at'] = this.photoUpdateAt;
    data['photo_driver_id'] = this.photoDriverId;
    return data;
  }
}
