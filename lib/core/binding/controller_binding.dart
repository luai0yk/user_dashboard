import 'package:get/instance_manager.dart';

import '../../controller/delete_controller.dart';
import '../../controller/insert_controller.dart';
import '../../controller/read_controller.dart';
import '../../controller/update_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InsertController());
    Get.put(ReadController());
    Get.put(UpdateController());
    Get.put(DeleteController());
  }
}
