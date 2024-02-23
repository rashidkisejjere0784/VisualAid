import 'package:therapp2/bindings/before_recording.dart';
import 'package:therapp2/bindings/file.dart';
import 'package:therapp2/bindings/files.dart';
import 'package:therapp2/bindings/home_bindings.dart';
import 'package:therapp2/bindings/navigation_bindings.dart';
import 'package:therapp2/bindings/login_binding.dart';
import 'package:get/get.dart';
import 'package:therapp2/services/pages/home.dart';
import 'package:therapp2/services/pages/navigation.dart';
import 'package:therapp2/services/pages/reading/beforeRecording.dart';
import 'package:therapp2/services/pages/reading/files.dart';
import 'package:therapp2/services/pages/reading/file.dart';
import 'package:therapp2/services/pages/splash_page.dart';
import 'package:therapp2/services/pages/auth/login_as_page.dart';
import 'package:therapp2/services/pages/auth/care_taker_login.dart';
import 'package:therapp2/services/pages/auth/user_login.dart';


class Routes{
  //Routing pages
  static const splash = '/';
  static const home = "/home";
  static const navigation = "/navigation";
  static const userLogin = "/userLogin";
  static const careTakerLogin = "/careTakerLogin";
  static const loginAs = "/loginAs";
  static const file = "/file";
  static const files = "/files";
  static const beforeRecording = "/beforeRecording";
}

class AppRoutes{
  static const splash = Routes.splash;
  static const home= Routes.home;
  static const navigation = Routes.navigation;
  static const userLogin = Routes.userLogin;
  static const careTakerLogin = Routes.careTakerLogin;
  static const loginAs = Routes.loginAs;
  static const file = Routes.file;
  static const files = Routes.files;
  static const beforeRecording = Routes.beforeRecording;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage()
    ),
    GetPage(
        name: Routes.loginAs,
        page: () => const LoginAsPage()
    ),
    GetPage(
        name: Routes.careTakerLogin,
        page: () => const CareTakerLogin(),
        binding: LoginBinding()
    ),
    GetPage(
        name: Routes.userLogin,
        page: () => const UserLogin(),
        binding: LoginBinding()
    ),
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
        name: Routes.userLogin,
        page: () => Navigation(),
        binding: NavigationBindings()
    ),
    GetPage(
        name: Routes.file,
        page: () => const NoteFile(),
        binding: NoteFileBindings()
    ),
    GetPage(
        name: Routes.files,
        page: () => const Files(),
        binding: FilesBindings()
    ),
    GetPage(
        name: Routes.beforeRecording,
        page: () => const BeforeRecording(),
        binding: BeforeRecordingBindings()
    ),
  ];
}