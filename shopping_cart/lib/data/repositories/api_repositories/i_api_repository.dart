import 'package:shopping_cart/data/models/api_response_model.dart';

abstract class IApiRepositories {
  Future<(String? , ApiResponseModel<T>?)> get<T>(String url);
}