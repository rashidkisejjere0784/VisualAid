import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:therapp2/services/core/links_and_keys/url_links.dart';
import 'package:therapp2/services/core/links_and_keys/api_keys.dart';
import 'get_address_from_location.dart';

Future getDirections(String start, String finish) async {
  try {
    Uri url = Uri.parse(googleDirectionsLink).replace(queryParameters: {
      'origin': start,
      'destination': finish,
      'mode': "walking",
      'key': GOOGLE_API_KEY,
    });

    http.Response response = await http.get(url);
    Map<String, dynamic> result = json.decode(response.body);
    return result;
  } catch (e) {
    return {"Error": "$e"};
  }
}
