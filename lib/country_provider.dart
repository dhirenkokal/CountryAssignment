import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'country_model.dart';
import 'package:connectivity/connectivity.dart';

class CountryProvider extends ChangeNotifier {
  List<Model> _countries = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<Model> get countries => _countries;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> fetchCountries() async {
    _isLoading = true;
    notifyListeners();

    try {
      bool isConnected = await checkInternetConnection();
      if (!isConnected) {
        _hasError = true;
        _isLoading = false;
        notifyListeners();
        return;
      }

      final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _countries = data.map((json) => Model.fromJson(json)).toList();
      } else {
        _hasError = true;
      }
    } catch (e) {
      _hasError = true;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false; // No internet connection
    } else {
      return true; // Internet connection is available
    }
  }

  Map<String, List<Model>> groupCountriesByRegion() {
    Map<String, List<Model>> countriesByRegion = {};
    for (var country in _countries) {
      String region = country.region ?? 'Other';
      if (!countriesByRegion.containsKey(region)) {
        countriesByRegion[region] = [];
      }
      countriesByRegion[region]!.add(country);
    }
    return countriesByRegion;
  }
}
