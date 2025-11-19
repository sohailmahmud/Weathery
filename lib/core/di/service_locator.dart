import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weatherapp/data/datasources/remote_weather_datasource_impl.dart';
import 'package:weatherapp/data/repositories/weather_repository_impl.dart';
import 'package:weatherapp/domain/repositories/weather_repository.dart';
import 'package:weatherapp/domain/usecases/get_weather_usecase.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Dio
  getIt.registerSingleton<Dio>(Dio());

  // Data Sources
  getIt.registerSingleton<RemoteWeatherDataSourceImpl>(
    RemoteWeatherDataSourceImpl(getIt<Dio>()),
  );

  // Repositories
  getIt.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(getIt<RemoteWeatherDataSourceImpl>()),
  );

  // Use Cases
  getIt.registerSingleton<GetWeatherUseCase>(
    GetWeatherUseCase(getIt<WeatherRepository>()),
  );

  // Controllers
  getIt.registerSingleton<WeatherController>(
    WeatherController(getIt<GetWeatherUseCase>()),
  );
}
