import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:php_api/controller/delete_controller.dart';
import 'package:php_api/controller/insert_controller.dart';
import 'package:php_api/controller/read_controller.dart';
import 'package:php_api/view/screens/update_page.dart';

import '../../model/user_model.dart';
import 'create_user_page.dart';

class ViewPage extends StatelessWidget {
  ViewPage({super.key});

  final InsertController insertController = Get.find<InsertController>();
  final ReadController readController = Get.find<ReadController>();
  final DeleteController deleteController = Get.find<DeleteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(InsertPage())!.then(
                (_) async {
                  await readController.readData();
                },
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text(
          "USERS",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: GetBuilder<ReadController>(
        initState: (state) async {
          await readController.readData();
        },
        builder: (controller) {
          return readController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : readController.users.isEmpty
                  ? const Center(
                      child: Text(
                        "No Data Found",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: readController.users.length,
                      itemBuilder: (context, index) {
                        UserModel user = readController.users[index];
                        return ListTile(
                          title: Text(user.name ?? 'Unknown'),
                          subtitle: Text('Age: ${user.age ?? 'N/A'}'),
                          leading: Text('${(index + 1)}'),
                          trailing: IconButton(
                            onPressed: () async {
                              await deleteController.deleteUser(user.id!);
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.indigo,
                          ),
                          onTap: () {
                            Get.to(UpdatePage(), arguments: user)!.then(
                              (_) async {
                                await readController.readData();
                              },
                            );
                          },
                        );
                      },
                    );
        },
      ),
    );
  }
}
