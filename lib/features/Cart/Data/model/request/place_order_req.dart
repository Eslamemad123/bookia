class PlaceOrderReq {
  num? governorateId;
  String? name;
  String? phone;
  String? address;
  String? email;

  PlaceOrderReq({
    this.governorateId,
    this.name,
    this.phone,
    this.address,
    this.email,
  });

  factory PlaceOrderReq.fromJson(Map<String, dynamic> json) => PlaceOrderReq(
    governorateId: num.tryParse(json['governorate_id'].toString()),
    name: json['name']?.toString(),
    phone: json['phone']?.toString(),
    address: json['address']?.toString(),
    email: json['email']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (governorateId != null) 'governorate_id': governorateId,
    if (name != null) 'name': name,
    if (phone != null) 'phone': phone,
    if (address != null) 'address': address,
    if (email != null) 'email': email,
  };
}
