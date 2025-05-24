import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/api_links.dart';
import '../core/services/api_services.dart';
import '../model/user_model.dart';
import 'read_controller.dart';

class UpdateController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final ReadController readController = Get.find<ReadController>();

  bool isLoading = false;

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    super.onClose();
  }

  void setInitialData(UserModel user) {
    nameController.text = user.name ?? '';
    ageController.text = user.age ?? '';
  }

  Future<void> updateUser({required String id}) async {
    if (formState.currentState!.validate()) {
      isLoading = true;
      update();

      UserModel user = UserModel(
        id: id,
        name: nameController.text,
        age: ageController.text,
      );

      try {
        var response = await ApiServices.postRequest(
          url: ApiLinks.update,
          data: user.toJson(),
        );

        if (response != null && response['status'] == 'success') {
          // Refresh the user list a now  after update
          await readController.readData();
          Get.back();
          Get.snackbar('Success', 'User updated successfully');
          nameController.clear();
          ageController.clear();
        } else {
          Get.snackbar('Error', 'Failed to update user');
        }
      } catch (error) {
        Get.snackbar('Error', 'An error occurred: $error');
      } finally {
        isLoading = false;
        update();
      }
    }
  }
}
