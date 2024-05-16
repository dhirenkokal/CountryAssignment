import 'dart:convert';

import 'package:flutter/material.dart';
import 'country_service.dart';
import 'package:http/http.dart' as http;
import 'country_model.dart';

// Modify the CountryProvider to include a method for grouping countries by region

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
