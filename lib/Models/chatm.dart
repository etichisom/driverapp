class Chatm {
  bool status;
  String message;
  CData data;

  Chatm({this.status, this.message, this.data});

  Chatm.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new CData.fromJson(json['data']) : null;
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

class CData {
  String ticketId;
  String ticketNumber;
  String ticketSubjects;
  String ticketCreateAt;
  String ticketStatus;
  String ticketDisplayStatus;
  String ticketPriority;
  List<ChatList> chatList;

  CData(
      {this.ticketId,
        this.ticketNumber,
        this.ticketSubjects,
        this.ticketCreateAt,
        this.ticketStatus,
        this.ticketDisplayStatus,
        this.ticketPriority,
        this.chatList});

  CData.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    ticketNumber = json['ticket_number'];
    ticketSubjects = json['ticket_subjects'];
    ticketCreateAt = json['ticket_create_at'];
    ticketStatus = json['ticket_status'];
    ticketDisplayStatus = json['ticket_display_status'];
    ticketPriority = json['ticket_priority'];
    if (json['chat_list'] != null) {
      chatList = new List<ChatList>();
      json['chat_list'].forEach((v) {
        chatList.add(new ChatList.fromJson(v));
      });
    }
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
    if (this.chatList != null) {
      data['chat_list'] = this.chatList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatList {
  String chatMessage;
  String chatMessagePosition;

  ChatList({this.chatMessage, this.chatMessagePosition});

  ChatList.fromJson(Map<String, dynamic> json) {
    chatMessage = json['chat_message'];
    chatMessagePosition = json['chat_message_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_message'] = this.chatMessage;
    data['chat_message_position'] = this.chatMessagePosition;
    return data;
  }
}
