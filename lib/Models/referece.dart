class Refm {
  bool status;
  String message;
  Data data;

  Refm({this.status, this.message, this.data});

  Refm.fromJson(Map<String, dynamic> json) {
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
  FirstReference firstReference;
  FirstReference secondReference;

  Data({this.firstReference, this.secondReference});

  Data.fromJson(Map<String, dynamic> json) {
    firstReference = json['first_reference'] != null
        ? new FirstReference.fromJson(json['first_reference'])
        : null;
    secondReference = json['second_reference'] != null
        ? new FirstReference.fromJson(json['second_reference'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.firstReference != null) {
      data['first_reference'] = this.firstReference.toJson();
    }
    if (this.secondReference != null) {
      data['second_reference'] = this.secondReference.toJson();
    }
    return data;
  }
}

class FirstReference {
  String referenceName;
  String referenceMobile;
  String referenceRelation;
  String referenceDate;
  String referenceTime;

  FirstReference(
      {this.referenceName,
        this.referenceMobile,
        this.referenceRelation,
        this.referenceDate,
        this.referenceTime});

  FirstReference.fromJson(Map<String, dynamic> json) {
    referenceName = json['reference_name'];
    referenceMobile = json['reference_mobile'];
    referenceRelation = json['reference_relation'];
    referenceDate = json['reference_date'];
    referenceTime = json['reference_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference_name'] = this.referenceName;
    data['reference_mobile'] = this.referenceMobile;
    data['reference_relation'] = this.referenceRelation;
    data['reference_date'] = this.referenceDate;
    data['reference_time'] = this.referenceTime;
    return data;
  }
}
