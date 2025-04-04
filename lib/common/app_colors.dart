import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  
  static const Color primary = Color(0xFF438883);
  static const Color secondary = Color(0xFF63B5AF);
  static const Color error = Color(0xFFF95B51);
  static const Color sucess = Color(0xFF25A969);
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textDetails = Color(0xFFFFFFFF);

  static const LinearGradient greenGradient = LinearGradient(
    colors: [secondary, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
