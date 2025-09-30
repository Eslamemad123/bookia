import 'package:collection/collection.dart';

class UpdatePasswordReq {
  String? currentPassword;
  String? newPassword;
  String? newPasswordConfirmation;

  UpdatePasswordReq({
    this.currentPassword,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  factory UpdatePasswordReq.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordReq(
      currentPassword: json['current_password']?.toString(),
      newPassword: json['new_password']?.toString(),
      newPasswordConfirmation: json['new_password_confirmation']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (currentPassword != null) 'current_password': currentPassword,
    if (newPassword != null) 'new_password': newPassword,
    if (newPasswordConfirmation != null)
      'new_password_confirmation': newPasswordConfirmation,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UpdatePasswordReq) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      currentPassword.hashCode ^
      newPassword.hashCode ^
      newPasswordConfirmation.hashCode;
}
