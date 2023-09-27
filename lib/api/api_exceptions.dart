
class ApiException implements Exception {

  int statusCode;
  String reason;

  ApiException({required this.statusCode, required this.reason});

  @override
  String toString() => "$statusCode: $reason";
}
