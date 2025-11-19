import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/domain/entities/weather_entity.dart';

void main() {
  group('Weather Data Integration Tests', () {
    test('weather entity serialization and deserialization', () {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final original = WeatherEntity(
        cityName: 'New York',
        temperature: 22.5,
        condition: 'Partly Cloudy',
        iconCode: '02d',
        minTemp: 18.0,
        maxTemp: 28.0,
        latitude: 40.7128,
        longitude: -74.0060,
        timestamp: timestamp,
      );

      // Simulate serialization by creating a map
      final serialized = {
        'cityName': original.cityName,
        'temperature': original.temperature,
        'condition': original.condition,
        'iconCode': original.iconCode,
        'minTemp': original.minTemp,
        'maxTemp': original.maxTemp,
        'latitude': original.latitude,
        'longitude': original.longitude,
        'timestamp': original.timestamp,
      };

      // Recreate from serialized data
      final deserialized = WeatherEntity(
        cityName: serialized['cityName'] as String,
        temperature: serialized['temperature'] as double,
        condition: serialized['condition'] as String,
        iconCode: serialized['iconCode'] as String,
        minTemp: serialized['minTemp'] as double,
        maxTemp: serialized['maxTemp'] as double,
        latitude: serialized['latitude'] as double,
        longitude: serialized['longitude'] as double,
        timestamp: serialized['timestamp'] as int,
      );

      expect(original, deserialized);
    });

    test('weather entity with extreme temperatures', () {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final hotWeather = WeatherEntity(
        cityName: 'Phoenix',
        temperature: 50.0,
        condition: 'Sunny',
        iconCode: '01d',
        minTemp: 45.0,
        maxTemp: 52.0,
        latitude: 33.4484,
        longitude: -112.0742,
        timestamp: timestamp,
      );

      final coldWeather = WeatherEntity(
        cityName: 'Siberia',
        temperature: -40.0,
        condition: 'Snowy',
        iconCode: '13d',
        minTemp: -45.0,
        maxTemp: -35.0,
        latitude: 66.8543,
        longitude: 104.2671,
        timestamp: timestamp,
      );

      expect(hotWeather.temperature, 50.0);
      expect(coldWeather.temperature, -40.0);
      expect(hotWeather.temperature > coldWeather.temperature, isTrue);
    });

    test('weather icon code variants', () {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final iconCodes = [
        '01d', '01n', // clear
        '02d', '02n', // few clouds
        '03d', '03n', // scattered clouds
        '04d', '04n', // broken clouds
        '09d', '09n', // shower rain
        '10d', '10n', // rain
        '11d', '11n', // thunderstorm
        '13d', '13n', // snow
        '50d', '50n', // mist
      ];

      for (final code in iconCodes) {
        final weather = WeatherEntity(
          cityName: 'Test City',
          temperature: 20.0,
          condition: 'Test',
          iconCode: code,
          minTemp: 15.0,
          maxTemp: 25.0,
          latitude: 0.0,
          longitude: 0.0,
          timestamp: timestamp,
        );

        expect(weather.iconCode, code);
      }
    });

    test('location coordinates validity', () {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final weather = WeatherEntity(
        cityName: 'Equator',
        temperature: 25.0,
        condition: 'Humid',
        iconCode: '04d',
        minTemp: 20.0,
        maxTemp: 30.0,
        latitude: 0.0,
        longitude: 0.0,
        timestamp: timestamp,
      );

      // Verify latitude is within valid range (-90 to 90)
      expect(weather.latitude >= -90 && weather.latitude <= 90, isTrue);
      // Verify longitude is within valid range (-180 to 180)
      expect(weather.longitude >= -180 && weather.longitude <= 180, isTrue);
    });
  });
}
