class Ticketm {
  bool status;
  String message;
  List<uData> data;

  Ticketm({this.status, this.message, this.data});

  Ticketm.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<uData>();
      json['data'].forEach((v) {
        data.add(new uData.fromJson(v));
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

class uData {
  String ticketId;
  String ticketNumber;
  String ticketSubjects;
  String ticketCreateAt;
  String ticketStatus;
  String ticketDisplayStatus;
  String ticketPriority;

  uData(
      {this.ticketId,
        this.ticketNumber,
        this.ticketSubjects,
        this.ticketCreateAt,
        this.ticketStatus,
        this.ticketDisplayStatus,
        this.ticketPriority});

  uData.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    ticketNumber = json['ticket_number'];
    ticketSubjects = json['ticket_subjects'];
    ticketCreateAt = json['ticket_create_at'];
    ticketStatus = json['ticket_status'];
    ticketDisplayStatus = json['ticket_display_status'];
    ticketPriority = json['ticket_priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_id'] = this.ticketId;
    data['ticket_number'] = this.ticketNumber;
    data['ticket_subjects'] = this.ticketSubjects;
    data['ticket_create_at'] = this.ticketCreateAt;
    data['ticket_status'] = this.ticketStatus;
    data['ticket_display_status'] = this.ticketDisplayStatus;
    data['ticket_priority'] = this.ticketPriority;
    return data;
  }
}
