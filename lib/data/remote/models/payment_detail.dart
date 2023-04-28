class PaymentInfoModel {
  int? status;
  String? message;
  PlanData? data;
  var error;

  PaymentInfoModel({this.status, this.message, this.data, this.error});

  PaymentInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PlanData.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
    return data;
  }
}

class PlanData {
  String? title;
  String? content;
  String? description;

  PlanData({
    this.title,
    this.content,
    this.description,
  });

  PlanData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['content'] = content;
    data['description'] = description;
    return data;
  }
}
