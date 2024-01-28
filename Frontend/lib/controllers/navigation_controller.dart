import 'package:get/get.dart';
import 'package:therapp2/services/core/navigation/get_user_location.dart';
import 'package:therapp2/services/utils/navigation/get_address_from_location.dart';

class NavigationController extends GetxController{
  final location = GetLocation();
  final destination = "".obs;
  final from = "".obs;
  final isLoading = false.obs;


  void init() async {
    final address = await location.getUserLocation();
    updateFrom(await getUserAddress(address['latitude'] ?? 0, address['longitude'] ?? 0));
  }

  updateDestination(String destination){
    this.destination(destination);
  }

  updateFrom(String from){
    this.from(from);
  }

  updateIsLoading(bool isLoading){
    this.isLoading(isLoading);
  }

}