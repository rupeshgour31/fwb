class PlanInfoModel {
  int? status;
  String? message;
  PaymentDetail? data;
  var error;

  PlanInfoModel({this.status, this.message, this.data, this.error});

  PlanInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PaymentDetail.fromJson(json['data']) : null;
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

class PaymentDetail {
  Business? business;
  Business? businessOwner;
  Business? professional;

  PaymentDetail({this.business, this.businessOwner, this.professional});

  PaymentDetail.fromJson(Map<String, dynamic> json) {
    business =
        json['business'] != null ? Business.fromJson(json['business']) : null;
    businessOwner = json['business_owner'] != null
        ? Business.fromJson(json['business_owner'])
        : null;
    professional = json['professional'] != null
        ? Business.fromJson(json['professional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (business != null) {
      data['business'] = business!.toJson();
    }
    if (businessOwner != null) {
      data['business_owner'] = businessOwner!.toJson();
    }
    if (professional != null) {
      data['professional'] = professional!.toJson();
    }
    return data;
  }
}

class Business {
  String? id;
  String? object;
  bool? active;
  int? amount;
  String? amountDecimal;
  String? billingScheme;
  int? created;
  String? currency;
  String? interval;
  int? intervalCount;
  bool? livemode;
  String? nickname;
  Product? product;
  String? usageType;

  Business({
    this.id,
    this.object,
    this.active,
    this.amount,
    this.amountDecimal,
    this.billingScheme,
    this.created,
    this.currency,
    this.interval,
    this.intervalCount,
    this.livemode,
    this.nickname,
    this.product,
    this.usageType,
  });

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    active = json['active'];
    amount = json['amount'];
    amountDecimal = json['amount_decimal'];
    billingScheme = json['billing_scheme'];
    created = json['created'];
    currency = json['currency'];
    interval = json['interval'];
    intervalCount = json['interval_count'];
    livemode = json['livemode'];

    nickname = json['nickname'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;

    usageType = json['usage_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['object'] = object;
    data['active'] = active;
    data['amount'] = amount;
    data['amount_decimal'] = amountDecimal;
    data['billing_scheme'] = billingScheme;
    data['created'] = created;
    data['currency'] = currency;
    data['interval'] = interval;
    data['interval_count'] = intervalCount;
    data['livemode'] = livemode;

    data['nickname'] = nickname;
    if (product != null) {
      data['product'] = product!.toJson();
    }

    data['usage_type'] = usageType;
    return data;
  }
}

class Product {
  String? id;
  String? object;
  bool? active;
  int? created;
  String? defaultPrice;
  String? description;
  bool? livemode;
  String? name;
  String? type;
  int? updated;

  Product({
    this.id,
    this.object,
    this.active,
    this.created,
    this.defaultPrice,
    this.description,
    this.livemode,
    this.name,
    this.type,
    this.updated,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    active = json['active'];
    created = json['created'];
    defaultPrice = json['default_price'];
    description = json['description'];
    livemode = json['livemode'];
    name = json['name'];
    type = json['type'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['object'] = object;
    data['active'] = active;
    data['created'] = created;
    data['default_price'] = defaultPrice;
    data['description'] = description;
    data['livemode'] = livemode;
    data['name'] = name;
    data['type'] = type;
    data['updated'] = updated;
    return data;
  }
}
