import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hulu_advert/src/bindings/bindings.dart';
import 'package:hulu_advert/src/bindings/product_binding.dart';
import 'package:hulu_advert/src/routes/app_routes.dart';
import 'package:hulu_advert/src/views/pages/auth/auth.dart';
import 'package:hulu_advert/src/views/pages/home/home_page.dart';
import 'package:hulu_advert/src/views/pages/intro/intro.dart';
import 'package:hulu_advert/src/views/pages/product/product_page.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.product,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
  ];
}
