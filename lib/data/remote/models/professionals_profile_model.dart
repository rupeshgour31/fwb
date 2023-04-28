class ProfessionalUserModel {
  int? status;
  String? message;
  ProfessionalUser? data;
  var error;

  ProfessionalUserModel({this.status, this.message, this.data, this.error});

  ProfessionalUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? ProfessionalUser.fromJson(json['data']) : null;
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

class ProfessionalUser {
  int? id;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
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
  bool? inTeam;

  ProfessionalUser({
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
    this.inTeam,
  });

  ProfessionalUser.fromJson(Map<String, dynamic> json) {
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
    inTeam = json['in_team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['in_team'] = inTeam;
    return data;
  }
}
