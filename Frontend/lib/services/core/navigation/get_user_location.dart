import 'package:location/location.dart';
import 'package:get/get.dart';

class GetLocation extends GetObserver{
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  GetLocation(){
    _initLocation();
  }

  void _initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<Map<String, double>> getUserLocation() async {
    LocationData locationData = await location.getLocation();
    return {
      'latitude': locationData.latitude ?? 0.0,
      'longitude': locationData.longitude ?? 0.0,
    };
  }
}