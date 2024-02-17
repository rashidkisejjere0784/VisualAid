import 'package:therapp2/bindings/before_recording.dart';
import 'package:therapp2/bindings/file.dart';
import 'package:therapp2/bindings/files.dart';
import 'package:therapp2/bindings/home_bindings.dart';
import 'package:therapp2/bindings/navigation_bindings.dart';
import 'package:get/get.dart';
import 'package:therapp2/services/pages/home.dart';
import 'package:therapp2/services/pages/navigation.dart';
import 'package:therapp2/services/pages/reading/beforeRecording.dart';
import 'package:therapp2/services/pages/reading/files.dart';
import 'package:therapp2/services/pages/reading/file.dart';

class Routes{
  //Routing pages
  static const home = "/";
  static const navigation = "/navigation";
  static const login = "/login";
  static const file = "/file";
  static const files = "/files";
  static const beforeRecording = "/beforeRecording";
}

class AppRoutes{
  static const home= Routes.home;
  static const navigation = Routes.navigation;
  static const login = Routes.login;
  static const file = Routes.file;
  static const files = Routes.files;
  static const beforeRecording = Routes.beforeRecording;

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