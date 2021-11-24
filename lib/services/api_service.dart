import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_starter_project/models/api_error.dart';
import 'package:flutter_starter_project/utils/constants.dart';

class APIService {
  Dio dio = Dio();

  String _buildUrl(String endpoint) {
    return "$apiBaseUrl$endpoint";
  }

  Future<Either<APIError, Response>> get({required String endpoint}) async {
    try {
      Response response = await dio.get(_buildUrl(endpoint));
      return Right(response);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          return Left(
              APIError("Connection not available", APIErrorType.noConnection));
        default:
          return Left(APIError("API Error", APIErrorType.other));
      }
    }
  }
}
