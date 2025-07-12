import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/onboarding_screen.dart';

void main() async {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
      },

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
