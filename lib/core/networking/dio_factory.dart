import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_warba_bank/core/networking/api_constants.dart';
import 'package:weather_warba_bank/core/networking/api_service.dart';

class DioFactory implements ApiServices {
  Dio? _dio;

  DioFactory() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10), //10 second
      receiveTimeout: const Duration(seconds: 10),
    );
    addDioInterceptor();
    _dio = Dio(baseOptions);
  }

  @override
  Future<Map<String, dynamic>> get({
    required String endPoint,
    required Map<String, dynamic> queryParameters,
  }) async {
    Response response =
        await _dio!.get(endPoint, queryParameters: queryParameters);
    return response.data;
  }

  addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
