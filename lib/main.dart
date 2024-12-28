// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// My classes
import 'package:metrok/screens/splash_screen.dart';
import 'package:metrok/localization/my_translations.dart';

final file = GetStorage();
Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String selectedLanguage = file.read('selectedLanguage') ?? 'en';

    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,

      home: const SplashScreen(),
      translations: MyTranslations(),
      locale: Locale(selectedLanguage), // Select the default device language
      fallbackLocale:
          const Locale('en'), // Default language if no translation is available
    );
  }
}