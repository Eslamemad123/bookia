import 'dart:developer';

class AuthParams {
  //conversion from object to json
  String? name;
  String? email;
  String? password;
  String? confirm_password;
  int? verify_code;
    String? Newpassword;
  String? confirm_Newpassword;

  AuthParams({
    this.name,
    this.email,
    this.password,
    this.confirm_password,
    this.verify_code,
    this.Newpassword,
    this.confirm_Newpassword,
  });
  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirm_password,
      "verify_code": verify_code,
      "new_password": Newpassword,
      "new_password_confirmation": confirm_Newpassword,
    };
  }
}
