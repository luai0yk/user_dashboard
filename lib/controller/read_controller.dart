import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../core/constant/api_links.dart';
import '../core/services/api_services.dart';
import '../model/user_model.dart';

class ReadController extends GetxController {
  bool isLoading = false;
  List<UserModel> users = [];

  Future<void> readData() async {
    isLoading = true;

    var response = await ApiServices.postRequest(url: ApiLinks.read, data: {});
    if (response != null && response is List) {
      users = response.map((e) => UserModel.fromJson(e)).toList();
    } else {
      users = [];
    }

    isLoading = false;
    update();
  }
}
