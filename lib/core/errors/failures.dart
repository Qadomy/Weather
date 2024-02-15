import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  const Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Api Server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromDioResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, Please try again!');
        }
      default:
        return ServerFailure('Ops there was an error, Please try again!');
    }
  }

  factory ServerFailure.fromDioResponse(int statsCode, dynamic response) {
    switch (statsCode) {
      case 401:
      case 402:
      case 403:
        return ServerFailure(response['error']['message']);
      case 404:
        return ServerFailure('Your request not found, Please try later!');
      case 500:
        return ServerFailure('Internal server error, Please try later!');
      default:
        return ServerFailure(response['error']['message']);
    }
  }
}
