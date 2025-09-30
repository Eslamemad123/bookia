class UpdateProfileReq {
  String? name;
  String? address;
  String? phone;

  UpdateProfileReq({this.name, this.address, this.phone});

  factory UpdateProfileReq.fromJson(Map<String, dynamic> json) {
    return UpdateProfileReq(
      name: json['name']?.toString(),
      address: json['address']?.toString(),
      phone: json['phone']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (name != null) 'name': name,
    if (address != null) 'address': address,
    if (phone != null) 'phone': phone,
  };
}
