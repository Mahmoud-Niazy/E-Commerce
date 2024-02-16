import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/service_locator/service_locator.dart';
import 'package:ecommerce/features/splash/presentation/view/splash_view.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
  ApiServices.init();
  ServicesLocator.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}


