import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_weather_app/models/location_model.dart';
import 'package:flutter_application_weather_app/services/weather_service.dart';
import 'package:flutter_application_weather_app/models/weather_model.dart';

class FavoriteLocationsPage extends StatefulWidget {
  const FavoriteLocationsPage({Key? key}) : super(key: key);

  @override
  State<FavoriteLocationsPage> createState() => _FavoriteLocationsPageState();
}

class _FavoriteLocationsPageState extends State<FavoriteLocationsPage> {
  final TextEditingController _locationController = TextEditingController();
  final WeatherService weatherService =
      WeatherService('354b9d1ba0ab02972cc53c28f32733bd');
  final databaseReference =
      FirebaseDatabase.instance.reference().child("locations");
  List<Location> _locations = [];

  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  void _loadLocations() {
    databaseReference.once().then((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null && data is Map) {
        final List<Location> locationList = [];
        data.forEach((key, value) {
          locationList.add(Location(id: key, name: value));
        });
        setState(() {
          _locations = locationList;
        });
      }
    });
  }

  void _addLocation() {
    final locationName = _locationController.text.trim();
    if (locationName.isNotEmpty) {
      final newLocationRef = databaseReference.push();
      newLocationRef.set(locationName);
      _locationController.clear();
      _loadLocations();
    }
  }

  void _deleteLocation(String locationId) {
    databaseReference.child(locationId).remove();
    _loadLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Locations'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _locationController,
                    decoration:
                        const InputDecoration(labelText: 'Location Name'),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addLocation,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) {
                final location = _locations[index];
                return Card(
                  elevation: 5, // Controla la elevación de la tarjeta
                  margin: const EdgeInsets.all(
                      10), // Añade un margen alrededor de la tarjeta
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(location.name),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteLocation(location.id),
                          ),
                        ),
                        FutureBuilder<Weather>(
                          future: weatherService.getWeather(location.name),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              final weather = snapshot.data;
                              return Column(
                                children: [
                                  Text(
                                      'Temperature: ${weather?.temperature}°C'),
                                  Text(
                                      'Main Condition: ${weather?.mainCondition}'),
                                ],
                              );
                            } else {
                              return const Text('No data available');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
