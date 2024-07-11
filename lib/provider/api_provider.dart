import 'package:flutter/material.dart';
import '../models/api_model.dart';
import '../services/api_services.dart';

class FoxProvider with ChangeNotifier {
  final ApiServices _apiService = ApiServices();
  Fox? _fox;
  bool _isLoading = false;

  Fox? get fox => _fox;
  bool get isLoading => _isLoading;

  Future<void> fetchFox() async {
    _isLoading = true;
    notifyListeners();

    _fox = await _apiService.fetchFox();
    _isLoading = false;
    notifyListeners();
  }
}