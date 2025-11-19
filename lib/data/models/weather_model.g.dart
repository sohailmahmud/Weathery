// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  cityName: json['name'] as String,
  main: MainData.fromJson(json['main'] as Map<String, dynamic>),
  weather: (json['weather'] as List<dynamic>)
      .map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
      .toList(),
  coord: CoordData.fromJson(json['coord'] as Map<String, dynamic>),
  timestamp: (json['dt'] as num).toInt(),
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'name': instance.cityName,
      'main': instance.main,
      'weather': instance.weather,
      'coord': instance.coord,
      'dt': instance.timestamp,
    };

MainData _$MainDataFromJson(Map<String, dynamic> json) => MainData(
  temp: (json['temp'] as num).toDouble(),
  tempMin: (json['temp_min'] as num).toDouble(),
  tempMax: (json['temp_max'] as num).toDouble(),
  humidity: (json['humidity'] as num).toInt(),
  pressure: (json['pressure'] as num).toInt(),
);

Map<String, dynamic> _$MainDataToJson(MainData instance) => <String, dynamic>{
  'temp': instance.temp,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'humidity': instance.humidity,
  'pressure': instance.pressure,
};

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
  main: json['main'] as String,
  description: json['description'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

CoordData _$CoordDataFromJson(Map<String, dynamic> json) => CoordData(
  lon: (json['lon'] as num).toDouble(),
  lat: (json['lat'] as num).toDouble(),
);

Map<String, dynamic> _$CoordDataToJson(CoordData instance) => <String, dynamic>{
  'lon': instance.lon,
  'lat': instance.lat,
};
