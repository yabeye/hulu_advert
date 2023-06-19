import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hulu_advert/global.dart';
import 'package:hulu_advert/src/routes/routes.dart';
import 'package:hulu_advert/src/themes/app_theme.dart';
import 'package:hulu_advert/src/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerGlobalDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Common.dismissKeyboard(),
      child: GetMaterialApp(
        title: appTitle,
        theme: AppThemes.themData,
        initialRoute: AppRoutes.initial,
        getPages: AppPages.pages,
        themeMode: ThemeMode.light,
        locale: const Locale('en-US'), // latter make this dynamic
        fallbackLocale: const Locale('en', 'US'),
        // translationsKeys: AppTranslation.translations,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
