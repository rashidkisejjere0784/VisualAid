import 'package:get/get.dart';
import 'package:therapp2/controllers/globalController.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies(){
    Get.put(GlobalController());
  }
}
