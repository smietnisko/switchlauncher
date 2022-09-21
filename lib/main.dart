import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'screens/home.dart';
import '../theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'switchlauncher',
      builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 2560,
          minWidth: 1280,
          minWidthLandscape: 1280,
          defaultScale: true,
          breakpointsLandscape: [
            ResponsiveBreakpoint.autoScale(1280, name: MOBILE),
          ],
          background: Container(color: basicWhite.background)),

      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
