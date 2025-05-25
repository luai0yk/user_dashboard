import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:php_api/core/binding/controller_binding.dart';
import 'package:php_api/view/screens/update_page.dart';

import '../../view/screens/create_user_page.dart';
import '../../view/screens/view_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final routes = [
    // Create User Page
    GetPage(
      name: AppRoutes.createUser,
      page: () => CreateUserPage(),
    ),
    // Edit User Page
    GetPage(
      name: AppRoutes.updateUser,
      page: () => UpdateUserPage(),
    ),
    // View Users Page
    GetPage(
      name: AppRoutes.viewUsers,
      page: () => ViewUsersPage(),
      binding: ControllerBinding(),
    ),
  ];
}
