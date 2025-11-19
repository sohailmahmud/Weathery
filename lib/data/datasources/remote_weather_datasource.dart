abstract class RemoteWeatherDataSource {
  Future<Map<String, dynamic>> getWeatherByCoordinates({
    required double latitude,
    required double longitude,
  });
}
