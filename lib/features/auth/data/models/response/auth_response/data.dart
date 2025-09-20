import 'user.dart';

class User_Data {
  User? user;
  String? token;

  User_Data({this.user, this.token});

  factory User_Data.fromJson(Map<String, dynamic> json) => User_Data(
    user:
        json['user'] == null
            ? null
            : User.fromJson(Map<String, dynamic>.from(json['user'])),
    token: json['token']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (user != null) 'user': user?.toJson(),
    if (token != null) 'token': token,
  };
}
