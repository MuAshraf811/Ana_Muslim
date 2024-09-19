import 'dart:async';

import 'package:location/location.dart';

class LocationService {
  LocationService._();

  static final _location = Location();
  static final StreamController<LocationModel> _controller =
      StreamController<LocationModel>();
  static Stream<LocationModel> get locationStream => _controller.stream;
  static late LocationModel locationMode;

  static handelPermission() async {
    bool isServiceEnabled = await _location.serviceEnabled();
    if (!isServiceEnabled) {
      await _location.requestService();
    } else {
      PermissionStatus status = await _location.hasPermission();
      if (status == PermissionStatus.denied ||
          status == PermissionStatus.deniedForever) {
        await _location.requestPermission();
      } else {
        final currentLocation = await _location.getLocation();
        locationMode = LocationModel(
          longitude: currentLocation.longitude!,
          latitude: currentLocation.latitude!,
        );
        _controller.add(
          locationMode = LocationModel(
            longitude: currentLocation.longitude!,
            latitude: currentLocation.latitude!,
          ),
        );
        _location.onLocationChanged.listen(
          (event) => _controller.add(
            locationMode = LocationModel(
              longitude: event.longitude!,
              latitude: event.latitude!,
            ),
          ),
        );
      }
    }
  }
}

class LocationModel {
  final double longitude;
  final double latitude;

  LocationModel({
    required this.longitude,
    required this.latitude,
  });
}
