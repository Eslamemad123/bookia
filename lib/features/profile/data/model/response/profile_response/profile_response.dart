import 'data.dart';

class ProfileResponse {
  DataShowProfile? data;
  String? message;
  List<dynamic>? error;
  num? status;

  ProfileResponse({this.data, this.message, this.error, this.status});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      data:
          json['data'] == null
              ? null
              : DataShowProfile.fromJson(
                Map<String, dynamic>.from(json['data']),
              ),
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
