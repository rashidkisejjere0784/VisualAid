import 'package:get/get.dart';
import 'package:therapp2/controllers/globalController.dart';

class BeforeRecordingBindings extends Bindings {
  @override
  void dependencies(){
    Get.put(GlobalController());
  }
}
