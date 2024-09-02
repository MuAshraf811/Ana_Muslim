import 'package:ana_muslim/core/utils/location_model.dart';
import 'package:location/location.dart';

class LocationHandler {
  LocationHandler._();

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
    await _manageLocationPermission();
    final data = await location.getLocation();
    return LocationModel(
      latitude: data.latitude ?? 30.4248,
      longitude: data.longitude ?? 31.486,
    );
  }

  static _manageLocationPermission() async {
    if (await _location!.serviceEnabled()) {
      await _location!.requestService();
    } else {
      final state = await _location!.requestPermission();
      if (state != PermissionStatus.granted ||
          state != PermissionStatus.grantedLimited) {
        await _location!.requestPermission();
      }
    }
  }
}
