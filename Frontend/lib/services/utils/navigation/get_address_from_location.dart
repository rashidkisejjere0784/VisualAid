// location_helper.dart
import 'package:geocoding/geocoding.dart';
Future<String> getUserAddress(double latitude, double longitude) async {
  try {
    // Reverse geocoding to get the address from coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    final placemark = placemarks[0];

    String street = placemark.street ?? "";
    String country = placemark.country ?? "";
    String postalCode = placemark.postalCode ?? "";
    String administrativeArea = placemark.administrativeArea ?? "";
    String locality = placemark.locality ?? "";

    // You can access other properties as needed

    // Construct a formatted address
    String formattedAddress = "$street, $locality, $administrativeArea, $country, $postalCode";

    return formattedAddress;
  } catch (e) {
    print("Error: $e");
    return "Error getting location";
  }
}
