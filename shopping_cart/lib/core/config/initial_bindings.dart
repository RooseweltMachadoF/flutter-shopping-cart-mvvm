import 'package:provider/provider.dart';
import 'package:shopping_cart/core/factories/api_repository_factory.dart';

class InitialBindings {
  static final InitialBindings _singleton = InitialBindings._internal();

  factory InitialBindings() {
    return _singleton;
  }
  
  InitialBindings._internal();

  static List<Provider> dependecies() {
    return [
      makeApiRepository,
    ];
  }
}