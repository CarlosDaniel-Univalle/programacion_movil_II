import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/models/weather_model.dart';
import 'package:flutter_application_weather_app/services/weather_service.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_weather_app/pages/favorite_locations_page.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api Key
  final _weatherService = WeatherService('354b9d1ba0ab02972cc53c28f32733bd');
  Weather? _weather;

  // fech weather
  _fetchWeather() async {
    // get the current city
    String cityName = await _weatherService.getCurrentCity();
    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    // any errors
    catch (e) {
      print(e);
    }
  }

  // weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json'; // default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/clouds.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  // init state
  @override
  void initState() {
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? "loading city.."),

            // animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            // temperature
            Text('${_weather?.temperature.round()}*C'),

            // weather condition
            Text(_weather?.mainCondition ?? ""),

            ElevatedButton(
              onPressed: () {
                // Navega a la otra vista
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FavoriteLocationsPage()), // Reemplaza "OtraVista" con el nombre de tu vista de destino
                );
              },
              child: Text('Ir a Otra Vista'),
            )
          ],
        ),
      ),
    );
  }
}
