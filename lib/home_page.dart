import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'country_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'country_model.dart';
import 'country_details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  late Map<String, List<Model>> _countriesByRegion = {};
  List<Model> _filteredCountries = [];
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    Provider.of<CountryProvider>(context, listen: false).fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Info'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterCountries('', []);
                        },
                      )
                          : null,
                    ),
                    onChanged: (value) {
                      final countries =
                          Provider.of<CountryProvider>(context, listen: false)
                              .countries;
                      _filterCountries(value, countries);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Consumer<CountryProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading && !_isRefreshing) {
                    return Center(child: CircularProgressIndicator());
                  } else if (provider.hasError) {
                    return Center(child: Text('Failed to load countries'));
                  } else if (_filteredCountries.isNotEmpty) {
                    return _buildCountryList(_filteredCountries);
                  } else {
                    _countriesByRegion =
                        provider.groupCountriesByRegion();
                    return _buildRegionTiles();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterCountries(String query, List<Model> countries) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredCountries = countries.where((country) {
          final name = country.name?.official?.toLowerCase() ?? '';
          return name.contains(query.toLowerCase());
        }).toList();
      } else {
        _filteredCountries = [];
      }
    });
  }

  Widget _buildCountryList(List<Model> countries) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryDetailsPage(country: country),
              ),
            );
          },
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            color: Colors.blueGrey[100],
            child: ListTile(
              leading: _buildFlagImage(country),
              title: Text(
                country.name!.official ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                'Capital: ${country.capital != null ? country.capital!.join(", ") : 'Unknown'}\nPopulation: ${country.population ?? 'Unknown'}',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRegionTiles() {
    return Expanded(
      child: ListView.builder(
        itemCount: _countriesByRegion.length,
        itemBuilder: (context, index) {
          final region = _countriesByRegion.keys.elementAt(index);
          final countries = _countriesByRegion[region]!;
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text(
                region,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              children: countries.map((country) => _buildCountryTile(country)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCountryTile(Model country) {
    return Card(
      color: Colors.blueGrey[100],
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: _buildFlagImage(country),
        title: Text(
          country.name!.official ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        subtitle: Text(
          'Capital: ${country.capital != null ? country.capital!.join(", ") : 'Unknown'}\nPopulation: ${country.population ?? 'Unknown'}',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryDetailsPage(country: country),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlagImage(Model country) {
    if (country.flags?.svg != null) {
      // If SVG is available, load it
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: SvgPicture.network(
            country.flags!.svg!,
            width: 40,
            height: 40,
            placeholderBuilder: (BuildContext context) => CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      // If SVG is not available, show error icon
      return Icon(Icons.error);
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
    });
    await Provider.of<CountryProvider>(context, listen: false).fetchCountries();
    setState(() {
      _isRefreshing = false;
    });
  }
}
