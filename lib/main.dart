import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:php_api/core/binding/controller_binding.dart';
import 'package:php_api/core/routes/app_pages.dart';
import 'package:php_api/core/routes/app_routes.dart';
import 'package:php_api/view/screens/view_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.indigo[200],
          selectionHandleColor: Colors.indigo,
        ),
      ),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.viewUsers,
      home: ViewUsersPage(),
    );
  }
}
