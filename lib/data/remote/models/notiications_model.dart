class NotificationsModel {
  int? status;
  String? message;
  List<NotificationData>? data;
  var error;

  NotificationsModel({
    this.status,
    this.message,
    this.data,
    this.error,
  });

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(NotificationData.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class NotificationData {
  int? id;
  int? sender;
  int? receiver;
  String? message;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  NotificationData({
    this.id,
    this.sender,
    this.receiver,
    this.message,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    receiver = json['receiver'];
    message = json['message'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['message'] = message;
    data['read_at'] = readAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
