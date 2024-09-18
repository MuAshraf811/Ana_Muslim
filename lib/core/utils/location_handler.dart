import 'dart:async';

import 'package:ana_muslim/core/utils/location_model.dart';
import 'package:location/location.dart';

class LocationHandler {
  LocationHandler._();

  static final StreamController<LocationModel> _locationStream =
      StreamController<LocationModel>();
  static Stream<LocationModel> get locationStream => _locationStream.stream;

  static Location? _location;
  static Location _initLocationService() {
    if (_location == null) {
      _location = Location();
      return _location!;
    }
    return _location!;
  }

  static Future<LocationModel> getuserCurrentLocation() async {
    final location = _initLocationService();
    final data = await location.getLocation();
    return LocationModel(
      latitude: data.latitude!,
      longitude: data.longitude!,
    );
  }

  static manageLocationPermission() async {
    final location = _initLocationService();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Handle service not enabled
        return;
      }
    }
    final state = await location.requestPermission();
    if (state == PermissionStatus.granted ||
        state == PermissionStatus.grantedLimited) {
      final currentLocation = await getuserCurrentLocation();
      _locationStream.add(currentLocation);
      location.onLocationChanged.listen(
        (locationData) {
          if (locationData != null) {
            _locationStream.add(
              LocationModel(
                latitude: locationData.latitude!,
                longitude: locationData.longitude!,
              ),
            );
          }
        },
      );
    } else {
      location.requestPermission();
    }
  }
}
