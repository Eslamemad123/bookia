import 'data.dart';

class OrderHistoryResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  num? status;

  OrderHistoryResponse({this.data, this.message, this.error, this.status});

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    return OrderHistoryResponse(
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
