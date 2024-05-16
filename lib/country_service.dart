import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart'; // Import the connectivity package
import 'country_model.dart';

class CountryService {
  Future<List<Model>> fetchCountries() async {
    try {
      // Check for device internet connection
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet connection
        throw Exception('No internet connection');
      } else {
        // Internet connection is available, proceed with fetching countries
        final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
        if (response.statusCode == 200) {
          print(response.body); // Add this line to print the response body
          List<dynamic> data = json.decode(response.body);
          return data.map((json) => Model.fromJson(json)).toList();
        } else {
          throw Exception('Failed to load countries: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error fetching countries: $e');
      throw Exception('Failed to load countries: $e');
    }
  }
}
