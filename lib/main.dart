import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/screens/home/home_screen.dart';
import 'package:task3/screens/splash/splash_screen.dart';
import 'package:task3/constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
    minTextAdapt: true,
   splitScreenMode: true,
    builder: (context , child) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Time Tracker',

    theme: ProjectTheme.themeData,
    home: SplashScreen(child: HomeScreen(),),
    );
    },

    );
  }
}

