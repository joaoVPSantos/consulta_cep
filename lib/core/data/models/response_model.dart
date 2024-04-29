// ignore_for_file: public_member_api_docs, sort_constructors_first

class ResponseModel {
  final int statusCode;
  final dynamic data;
  final String? message;
  ResponseModel({
    required this.statusCode,
    this.data,
    this.message,
  });
}
