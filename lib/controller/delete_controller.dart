import 'package:get/get.dart';

import '../core/constant/api_links.dart';
import '../core/services/api_services.dart';
import 'read_controller.dart';

class DeleteController extends GetxController {
  final ReadController readController = Get.find<ReadController>();
  bool isLoading = false;

  Future<void> deleteUser(String id) async {
    isLoading = true;
    update();

    try {
      var response = await ApiServices.postRequest(
        url: ApiLinks.delete,
        data: {'id': id},
      );

      if (response != null && response['status'] == 'success') {
        Get.snackbar('Success', 'User deleted successfully');
        // Refresh the user list after deletion
        await readController.readData();
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete user: ${response?['message'] ?? 'Unknown error'}',
        );
      }
    } catch (error) {
      Get.snackbar('Error', 'An error occurred: $error');
    } finally {
      isLoading = false;
      update();
    }
  }
}
