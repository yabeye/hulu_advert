import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hulu_advert/src/bindings/bindings.dart';
import 'package:hulu_advert/src/routes/app_routes.dart';
import 'package:hulu_advert/src/views/pages/splash/splash.dart';
import 'package:hulu_advert/src/views/pages/home/home.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(title: "Home Page!"),
      binding: HomeBinding(),
    ),
  ];
}
