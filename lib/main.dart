import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/routes/routes.dart';
import 'package:hulu_advert/src/utils/constants.dart';
import 'package:hulu_advert/src/utils/utils.dart';

void main() {
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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
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
