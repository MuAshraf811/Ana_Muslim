import 'dart:async';

import 'package:ana_muslim/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService {
  UserLocation? _currentLocation;

  Location location = Location();

  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location

    location.requestPermission().then((x) {
      if (x == PermissionStatus.granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude ?? 21,
              longitude: locationData.longitude ?? 21,
            ));
          }
        });
      }
    });
  }

  Future<UserLocation?> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude ?? 21,
        longitude: userLocation.longitude ?? 21,
      );
    } on Exception catch (e) {
      debugPrint('Could not get location: ${e.toString()}');
    }

    return _currentLocation!;
  }
}

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({required this.latitude, required this.longitude});
}
