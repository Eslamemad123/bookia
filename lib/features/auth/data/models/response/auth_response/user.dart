class User {
  num? id;
  String? name;
  String? email;
  dynamic address;
  dynamic city;
  dynamic phone;
  bool? emailVerified;
  String? image;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: num.tryParse(json['id'].toString()),
    name: json['name']?.toString(),
    email: json['email']?.toString(),
    address: json['address'],
    city: json['city'],
    phone: json['phone'],
    emailVerified: json['email_verified']?.toString().contains("true"),
    image: json['image']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    if (name != null) 'name': name,
    if (email != null) 'email': email,
    if (address != null) 'address': address,
    if (city != null) 'city': city,
    if (phone != null) 'phone': phone,
    if (emailVerified != null) 'email_verified': emailVerified,
    if (image != null) 'image': image,
  };
}
