import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:php_api/controller/update_controller.dart';
import 'package:php_api/core/utils/validator.dart';
import 'package:php_api/view/widget/custom_button.dart';

import '../../model/user_model.dart';
import '../widget/custom_form_field.dart';

class UpdatePage extends StatelessWidget {
  UpdatePage({super.key});

  final UpdateController updateController = Get.find<UpdateController>();

  @override
  Widget build(BuildContext context) {
    UserModel userData =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    updateController.setInitialData(userData);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          'update user'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<UpdateController>(
              builder: (controller) => Form(
                key: controller.formState,
                child: Column(
                  children: [
                    CustomFormField(
                      hint: 'Name',
                      controller: controller.nameController,
                      validator: (value) {
                        return Validator.validate(value);
                      },
                    ),
                    CustomFormField(
                      hint: 'Age',
                      inputType: TextInputType.number,
                      controller: controller.ageController,
                      validator: (value) {
                        return Validator.validate(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onPressed: () => updateController.updateUser(id: userData.id!),
              text: 'update',
            )
          ],
        ),
      ),
    );
  }
}
