import 'package:dio/dio.dart';
import 'package:weatherapp/data/datasources/remote_weather_datasource.dart';

class RemoteWeatherDataSourceImpl implements RemoteWeatherDataSource {
  final Dio dio;
  static const String _apiKey = 'c1d52137eb808057da448176959cd483';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  RemoteWeatherDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> getWeatherByCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      // Get current weather
      final currentResponse = await dio.get(
        '$_baseUrl/weather',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'units': 'metric',
          'appid': _apiKey,
        },
      );

      if (currentResponse.statusCode != 200) {
        throw Exception(
          'API Error ${currentResponse.statusCode}: ${currentResponse.data}',
        );
      }

      final currentData = currentResponse.data as Map<String, dynamic>;

      // Get forecast for accurate daily min/max
      final forecastResponse = await dio.get(
        '$_baseUrl/forecast',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'units': 'metric',
          'appid': _apiKey,
          'cnt': 8, // Get 1 day forecast (8 forecasts of 3 hours each)
        },
      );

      if (forecastResponse.statusCode == 200) {
        final forecastData = forecastResponse.data as Map<String, dynamic>;
        final forecasts = forecastData['list'] as List;

        if (forecasts.isNotEmpty) {
          // Calculate daily min/max from forecast
          double minTemp = double.infinity;
          double maxTemp = -double.infinity;

          for (var forecast in forecasts) {
            final main = forecast['main'] as Map<String, dynamic>;
            final temp = (main['temp'] as num).toDouble();
            minTemp = minTemp > temp ? temp : minTemp;
            maxTemp = maxTemp < temp ? temp : maxTemp;
          }

          // Update current data with forecast min/max
          (currentData['main'] as Map<String, dynamic>)['temp_min'] = minTemp;
          (currentData['main'] as Map<String, dynamic>)['temp_max'] = maxTemp;
        }
      }

      return currentData;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'API Error ${e.response?.statusCode}: ${e.response?.data}',
        );
      }
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}
