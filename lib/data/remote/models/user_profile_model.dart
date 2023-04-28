class UserProfileModel {
  int? status;
  String? message;
  Data? data;
  var error;

  UserProfileModel({this.status, this.message, this.data, this.error});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? username;
  String? email;
  var emailVerifiedAt;
  String? role;
  String? industry;
  String? phone;
  String? zipcode;
  String? state;
  String? city;
  String? address;
  String? businessType;
  String? businessName;
  String? stripeId;
  String? bio;
  String? profileImage;
  String? thumbImage;

  Data({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.industry,
    this.phone,
    this.zipcode,
    this.state,
    this.city,
    this.address,
    this.businessType,
    this.businessName,
    this.stripeId,
    this.bio,
    this.profileImage,
    this.thumbImage,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    industry = json['industry'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    businessType = json['business_type'];
    businessName = json['business_name'];
    stripeId = json['stripe_id'];
    bio = json['bio'];
    profileImage = json['profile_image'];
    thumbImage = json['thumb_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['role'] = role;
    data['industry'] = industry;
    data['phone'] = phone;
    data['zipcode'] = zipcode;
    data['state'] = state;
    data['city'] = city;
    data['address'] = address;
    data['business_type'] = businessType;
    data['business_name'] = businessName;
    data['stripe_id'] = stripeId;
    data['bio'] = bio;
    data['profile_image'] = profileImage;
    data['thumb_image'] = thumbImage;
    return data;
  }
}
