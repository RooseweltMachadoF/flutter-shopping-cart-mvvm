import 'package:flutter/foundation.dart';

abstract class Command<T> extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  T? _data;
  T? get data => _data;

  Future<void> execute();

  @protected
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @protected
  void setError(String? value) {
    _error = value;
    notifyListeners();
  }

  @protected
  void setData(T? value) {
    _data = value;
    notifyListeners();
  }
}