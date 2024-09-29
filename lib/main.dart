import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/services/service_locator.dart';
import 'package:movies_app/shared/style/app_theme.dart';
import 'features/home/home_screen.dart';


void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.themeData,


    );
  }
}

