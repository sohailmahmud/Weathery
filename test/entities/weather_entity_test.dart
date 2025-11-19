import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/domain/entities/weather_entity.dart';

void main() {
  group('WeatherEntity', () {
    test('creates a weather entity with all properties', () {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final entity = WeatherEntity(
        cityName: 'London',
        temperature: 15.5,
        condition: 'Rainy',
        iconCode: '09d',
        minTemp: 12.0,
        maxTemp: 18.0,
        latitude: 51.5074,
        longitude: -0.1278,
        timestamp: timestamp,
      );

      expect(entity.cityName, 'London');
      expect(entity.temperature, 15.5);
      expect(entity.condition, 'Rainy');
      expect(entity.iconCode, '09d');
      expect(entity.minTemp, 12.0);
      expect(entity.maxTemp, 18.0);
      expect(entity.latitude, 51.5074);
      expect(entity.longitude, -0.1278);
    });

    test('weather entities with same data are equal', () {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final entity1 = WeatherEntity(
        cityName: 'London',
        temperature: 15.5,
        condition: 'Rainy',
        iconCode: '09d',
        minTemp: 12.0,
        maxTemp: 18.0,
        latitude: 51.5074,
        longitude: -0.1278,
        timestamp: timestamp,
      );

      final entity2 = WeatherEntity(
        cityName: 'London',
        temperature: 15.5,
        condition: 'Rainy',
        iconCode: '09d',
        minTemp: 12.0,
        maxTemp: 18.0,
        latitude: 51.5074,
        longitude: -0.1278,
        timestamp: timestamp,
      );

      expect(entity1, entity2);
    });
  });
}
