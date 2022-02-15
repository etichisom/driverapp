class Helpm {
  bool status;
  String error;
  List<Data> data;

  Helpm({this.status, this.error, this.data});

  Helpm.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
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
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String helpId;
  String helpTitle;
  String helpDescription;
  String helpCreateAt;
  String helpImage;
  String helpShortDescription;

  Data(
      {this.helpId,
        this.helpTitle,
        this.helpDescription,
        this.helpCreateAt,
        this.helpImage,
        this.helpShortDescription});

  Data.fromJson(Map<String, dynamic> json) {
    helpId = json['help_id'];
    helpTitle = json['help_title'];
    helpDescription = json['help_description'];
    helpCreateAt = json['help_create_at'];
    helpImage = json['help_image'];
    helpShortDescription = json['help_short_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['help_id'] = this.helpId;
    data['help_title'] = this.helpTitle;
    data['help_description'] = this.helpDescription;
    data['help_create_at'] = this.helpCreateAt;
    data['help_image'] = this.helpImage;
    data['help_short_description'] = this.helpShortDescription;
    return data;
  }
}
