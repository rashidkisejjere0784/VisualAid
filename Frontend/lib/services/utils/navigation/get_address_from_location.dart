// location_helper.dart
import 'package:geocoding/geocoding.dart';

Future<Map> getUserAddress(double latitude, double longitude) async {
  try {
    // Reverse geocoding to get the address from coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    final placemark = placemarks[0];
    print(placemark);

    String name = placemark.name ?? "";
    String street = placemark.street ?? "";
    String country = placemark.country ?? "";
    String postalCode = placemark.postalCode ?? "";
    String administrativeArea = placemark.administrativeArea ?? "";
    String locality = placemark.locality ?? "";

    // You can access other properties as needed

    // Construct a formatted address
    final formattedAddress = {
      "placeId": name,
      "country": country,
      "full address":
          "$street, $locality, $administrativeArea, $country, $postalCode"
    };

    return formattedAddress;
  } catch (e) {
    print("Error: $e");
    return {
      "Error" : "$e"
    };
  }
}
