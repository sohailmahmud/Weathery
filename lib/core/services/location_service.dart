import 'package:geolocator/geolocator.dart';

class LocationPermissionException implements Exception {
  final String message;
  final bool isPermanentlyDenied;
  final bool needsSettings;

  LocationPermissionException({
    required this.message,
    this.isPermanentlyDenied = false,
    this.needsSettings = false,
  });

  @override
  String toString() => message;
}

class LocationService {
  static Future<Position> getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationPermissionException(
        message: 'Location services are disabled. Please enable them in settings.',
        needsSettings: true,
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();

    // If permission is denied, request it
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // If permanently denied, ask user to go to settings
    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionException(
        message: 'Location permission is permanently denied. Please enable it in app settings.',
        isPermanentlyDenied: true,
        needsSettings: true,
      );
    }

    // If still denied after request, show message
    if (permission == LocationPermission.denied) {
      throw LocationPermissionException(
        message: 'Location permission is required to display weather. Please grant it.',
        isPermanentlyDenied: false,
      );
    }

    // If location services are restricted
    if (permission == LocationPermission.unableToDetermine) {
      throw LocationPermissionException(
        message: 'Unable to determine location permission status.',
      );
    }

    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      throw LocationPermissionException(
        message: 'Failed to get your location. Please try again.',
      );
    }
  }

  /// Open app settings for location permission
  static Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }
}
