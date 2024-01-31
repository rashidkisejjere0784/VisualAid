import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

class GetLocation extends GetObserver {
  late Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  GetLocation() {
    _initLocation();
  }

  void _initLocation() async {
    await location.changeSettings(accuracy: LocationAccuracy.high);

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

  Future<Map<String, dynamic>> getUserLocationAndPlaceId() async {
    LocationData position = await location.getLocation();

    final placeId = await getPlaceId(position.latitude!, position.longitude!);

    return {
      'latitude': position.latitude ?? 0.0,
      'longitude': position.longitude ?? 0.0,
      'placeId': placeId['place_id'],
      'address' : placeId['address']
    };
  }


  Future getPlaceId(double latitude, double longitude) async {
    const apiKey = 'AIzaSyAywia2PyE6_PS8sEnaxugF_QhWD7d2u_I'; // Replace with your API key
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final results = decodedResponse['results'] as List<dynamic>;

      if (results.isNotEmpty) {
        final placeId = results[0]['place_id'] as String?;
        final address = results[0]['formatted_address'] as String?;
        return {
          "place_id" : placeId,
          "address" : address
        };
      }
    }

    return null;
  }
}
