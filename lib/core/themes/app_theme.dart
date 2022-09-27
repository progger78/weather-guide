import 'package:flutter/material.dart';

class AppTheme {
  static const Color titleTextColor = Color.fromARGB(221, 31, 31, 31);
  static const Color secondaryColor = Color.fromARGB(255, 255, 169, 41);
  static const Color lightPrimaryColor = Color.fromARGB(255, 255, 209, 230);
  static const Color primaryAppColor = Color.fromARGB(255, 74, 49, 105);
  static const Color lightGrayColor = Color.fromARGB(255, 188, 188, 188);
  static const mainLinearGradien = LinearGradient(
    colors: [Color.fromARGB(255, 213, 104, 133), AppTheme.primaryAppColor],
  );
  static const mainLinearGradientBackwards = LinearGradient(
    colors: [AppTheme.primaryAppColor, Color.fromARGB(255, 213, 104, 133)],
  );

  const AppTheme._();
  
  static final lightTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
