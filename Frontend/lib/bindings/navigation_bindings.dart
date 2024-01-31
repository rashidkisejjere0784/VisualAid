import 'package:get/get.dart';
import 'package:therapp2/controllers/globalController.dart';
import 'package:therapp2/controllers/navigation_controller.dart';

class NavigationBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.put(GlobalController());
  }
}