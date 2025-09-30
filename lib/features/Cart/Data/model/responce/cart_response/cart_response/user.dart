class User {
  num? userId;
  String? userName;

  User({this.userId, this.userName});

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: num.tryParse(json['user_id'].toString()),
    userName: json['user_name']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (userId != null) 'user_id': userId,
    if (userName != null) 'user_name': userName,
  };
}
