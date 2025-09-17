import 'data.dart';

class AuthResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  num? status;

  AuthResponse({this.data, this.message, this.error, this.status});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    data:
        json['data'] == null
            ? null
            : Data.fromJson(Map<String, dynamic>.from(json['data'])),
    message: json['message']?.toString(),
    error: List<dynamic>.from(json['error'] ?? []),
    status: num.tryParse(json['status'].toString()),
  );

  Map<String, dynamic> toJson() => {
    if (data != null) 'data': data?.toJson(),
    if (message != null) 'message': message,
    if (error != null) 'error': error,
    if (status != null) 'status': status,
  };
}
