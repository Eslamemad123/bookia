import 'data.dart';

class Books_Response {
  Data? data;
  String? message;
  List<dynamic>? error;
  num? status;

  Books_Response({this.data, this.message, this.error, this.status});

  factory Books_Response.fromJson(Map<String, dynamic> json) => Books_Response(
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
