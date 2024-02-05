import 'package:therapp2/bindings/home_bindings.dart';
import 'package:therapp2/bindings/navigation_bindings.dart';
import 'package:get/get.dart';

import 'package:therapp2/services/pages/home.dart';
import 'package:therapp2/services/pages/navigation.dart';

class Routes{
  //Routing pages
  static const home = "/";
  static const navigation = "/navigation";
  static const login = "/login";
}

class AppRoutes{
  static const home= Routes.home;
  static const navigation = Routes.navigation;
  static const login = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const Home(title: "Title",),
      binding: HomeBindings()
    ),
    GetPage(
        name: Routes.navigation,
        page: () => Navigation(),
        binding: NavigationBindings()
    ),
    GetPage(
        name: Routes.login,
        page: () => Navigation(),
        binding: NavigationBindings()
    )
  ];
}