import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: 'name')
  final String cityName;

  @JsonKey(name: 'main')
  final MainData main;

  @JsonKey(name: 'weather')
  final List<WeatherData> weather;

  @JsonKey(name: 'coord')
  final CoordData coord;

  @JsonKey(name: 'dt')
  final int timestamp;

  WeatherModel({
    required this.cityName,
    required this.main,
    required this.weather,
    required this.coord,
    required this.timestamp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  WeatherEntity toEntity() {
    if (weather.isEmpty) {
      return WeatherEntity(
        cityName: cityName,
        temperature: main.temp,
        condition: 'Unknown',
        iconCode: '01d',
        minTemp: main.tempMin,
        maxTemp: main.tempMax,
        latitude: coord.lat,
        longitude: coord.lon,
        timestamp: timestamp,
      );
    }

    final weatherData = weather[0];

    // Use the main field from API response (e.g., "Clear", "Clouds", "Rain", "Thunderstorm", "Snow")
    final condition = weatherData.main;

    return WeatherEntity(
      cityName: cityName,
      temperature: main.temp,
      condition: condition,
      iconCode: weatherData.icon,
      minTemp: main.tempMin,
      maxTemp: main.tempMax,
      latitude: coord.lat,
      longitude: coord.lon,
      timestamp: timestamp,
    );
  }
}

@JsonSerializable()
class MainData {
  final double temp;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  MainData({required this.temp, required this.tempMin, required this.tempMax});

  factory MainData.fromJson(Map<String, dynamic> json) =>
      _$MainDataFromJson(json);

  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}

@JsonSerializable()
class WeatherData {
  final String main;
  final String description;
  final String icon;

  WeatherData({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class CoordData {
  final double lon;
  final double lat;

  CoordData({required this.lon, required this.lat});

  factory CoordData.fromJson(Map<String, dynamic> json) =>
      _$CoordDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoordDataToJson(this);
}
