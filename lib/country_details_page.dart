import 'package:flutter/material.dart';
import 'country_model.dart';

class CountryDetailsPage extends StatelessWidget {
  final Model country;

  CountryDetailsPage({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name!.official ?? 'Country Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade400],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 20),
                _buildDetailItem('Capital', country.capital != null ? country.capital!.join(", ") : 'Unknown'),
                _buildDetailItem('Population', country.population != null ? country.population!.toString() : 'Unknown'),
                _buildDetailItem('Area', country.area != null ? '${country.area} sq km' : 'Unknown'),
                _buildDetailItem('Region', country.region ?? 'Unknown'),
                _buildDetailItem('Subregion', country.subregion ?? 'Unknown'),
                _buildDetailItem('Borders', country.borders != null ? country.borders!.join(", ") : 'None'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country Details',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          country.name?.official ?? 'Unknown',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Divider(color: Colors.white),
        SizedBox(height: 16),
      ],
    );
  }
}
