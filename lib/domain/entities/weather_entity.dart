import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final double temperature;
  final String condition;
  final String iconCode;
  final double minTemp;
  final double maxTemp;
  final double latitude;
  final double longitude;
  final int timestamp;

  const WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.iconCode,
    required this.minTemp,
    required this.maxTemp,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
    cityName,
    temperature,
    condition,
    iconCode,
    minTemp,
    maxTemp,
    latitude,
    longitude,
    timestamp,
  ];
}
