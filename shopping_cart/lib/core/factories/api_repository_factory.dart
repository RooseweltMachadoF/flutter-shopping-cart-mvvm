import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/service/dot_env_services.dart';
import 'package:shopping_cart/data/repositories/api_repositories/i_api_repository.dart';
import 'package:shopping_cart/data/repositories/dio/dio_repository.dart';

final makeApiRepository = Provider<IApiRepositories>(
  create: (_) => DioRepository(
    Dio(
      BaseOptions(
        baseUrl: DotEnvServices.getApiBaseUrl,
        connectTimeout: Duration(seconds: 180),
        receiveTimeout: Duration(seconds: 180),
        ),
    ),
    ));