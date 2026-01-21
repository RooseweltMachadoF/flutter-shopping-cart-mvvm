import 'package:dio/dio.dart';
import 'package:shopping_cart/core/const/errors_const.dart';
import 'package:shopping_cart/data/models/api_response_model.dart';
import 'package:shopping_cart/data/repositories/api_repositories/i_api_repository.dart';

class DioRepository implements IApiRepositories{
  final Dio _dio;

  DioRepository( this._dio);

  @override
  Future<(String?, ApiResponseModel<T>?)> get<T> (String endpoint) async {
    try {
      final response = await _dio.get(
        endpoint,
        options: Options(
          headers: {
            'Accept': 'application/json',
            } 
        ));
      return (null, ApiResponseModel<T>(data: response.data as T, statusMessage:response.statusMessage));
    }on DioException catch (dioError) {
      final errorMessage = dioError.message ?? ErrorsConst.API_DEFAULT_ERROR;
      return (errorMessage, null);
    }
  }

}