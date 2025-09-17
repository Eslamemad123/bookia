import 'user.dart';

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
