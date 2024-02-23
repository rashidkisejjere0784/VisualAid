import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:therapp2/services/core/links_and_keys/url_links.dart';

const String imgToTextLink = '$backendServerLink/reading/extract_img';
const String imgCaptionLink = 'https://visualaid-dwwrohdoca-uc.a.run.app/navigation/caption_img';



Future<String> getImgResponse(Uint8List? imageBytes, int reason) async {
  if (imageBytes == null) {
    return 'Image capture failed';
  }

  try {
    final request = http.Request('POST', Uri.parse(imgCaptionLink));

    // Attach MultipartFile instance to request
    //request.files.add(http.MultipartFile.fromBytes('image', imageBytes));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('API request failed with status code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return 'API request failed ,${response.body}';
    }
  } catch (e) {
    print('Error sending image to API: $e');
    return 'Error sending image to API: $e';
  }
}