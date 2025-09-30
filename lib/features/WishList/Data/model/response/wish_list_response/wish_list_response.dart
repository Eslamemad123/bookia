import 'data.dart';

class WishListResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  num? status;

  WishListResponse({this.data, this.message, this.error, this.status});

  factory WishListResponse.fromJson(Map<String, dynamic> json) {
    return WishListResponse(
      data:
          json['data'] == null
              ? null
              : Data.fromJson(Map<String, dynamic>.from(json['data'])),
      message: json['message']?.toString(),
      error: List<dynamic>.from(json['error'] ?? []),
      status: num.tryParse(json['status'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    if (data != null) 'data': data?.toJson(),
    if (message != null) 'message': message,
    if (error != null) 'error': error,
    if (status != null) 'status': status,
  };
}
