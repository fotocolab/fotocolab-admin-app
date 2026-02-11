class BaseDynamicResponse<T> {
  final String? status;
  final int? statusCode;
  final String? message;
  final dynamic data;

  BaseDynamicResponse({this.status, this.statusCode, this.message, this.data});

  factory BaseDynamicResponse.error({
    int? success,
    int? statusCode,
    String? message,
  }) {
    return BaseDynamicResponse(
      statusCode: statusCode ?? 400,
      message: message ?? 'Something went wrong',
      status: 'failed',
      data: null,
    );
  }

  factory BaseDynamicResponse.success({
    int? success,
    int? statusCode,
    String? message,
    final String? status,
  }) {
    return BaseDynamicResponse(
      statusCode: statusCode ?? 200,
      message: message ?? 'Success',
      status: 'success',
      data: null,
    );
  }

  factory BaseDynamicResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    final rawData = json['data'];

    dynamic parsedData;
    if (rawData is List) {
      parsedData = rawData.map((e) => fromJsonT(e)).toList();
    } else if (rawData is Map<String, dynamic>) {
      parsedData = fromJsonT(rawData);
    } else {
      parsedData = rawData as T?;
    }

    return BaseDynamicResponse<T>(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: parsedData,
    );
  }
}
