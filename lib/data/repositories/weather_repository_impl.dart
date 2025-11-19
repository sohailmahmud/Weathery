import 'package:weatherapp/data/datasources/remote_weather_datasource.dart';
import 'package:weatherapp/data/models/weather_model.dart';
import 'package:weatherapp/domain/entities/weather_entity.dart';
import 'package:weatherapp/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteWeatherDataSource remoteWeatherDataSource;

  WeatherRepositoryImpl(this.remoteWeatherDataSource);

  @override
  Future<WeatherEntity> getWeatherByCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    final jsonData = await remoteWeatherDataSource.getWeatherByCoordinates(
      latitude: latitude,
      longitude: longitude,
    );

    final weatherModel = WeatherModel.fromJson(jsonData);
    return weatherModel.toEntity();
  }
}
