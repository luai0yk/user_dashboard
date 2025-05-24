import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:php_api/view/widget/custom_button.dart';

import '../../controller/insert_controller.dart';
import '../../core/utils/validator.dart';
import '../widget/custom_form_field.dart';

class InsertPage extends StatelessWidget {
  InsertPage({super.key});

  final InsertController insertController = Get.find<InsertController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          'create user'.toUpperCase(),
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
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: insertController.formState,
              child: Column(
                children: [
                  CustomFormField(
                    hint: 'Name',
                    controller: insertController.nameController,
                    validator: (value) {
                      return Validator.validate(value);
                    },
                  ),
                  CustomFormField(
                    hint: 'Age',
                    inputType: TextInputType.number,
                    controller: insertController.ageController,
                    validator: (value) {
                      return Validator.validate(value);
                    },
                  ),
                ],
              ),
            ),
            CustomButton(
              onPressed: () => insertController.insert(),
              text: 'create',
            ),
          ],
        ),
      ),
    );
  }
}
