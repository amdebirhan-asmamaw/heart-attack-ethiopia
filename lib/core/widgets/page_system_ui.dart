import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageSystemUi extends StatelessWidget {
  const PageSystemUi({
    required this.systemNavigationBarColor,
    required this.child,
    super.key,
  });

  final Color systemNavigationBarColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundBrightness = ThemeData.estimateBrightnessForColor(
      systemNavigationBarColor,
    );
    final iconBrightness = backgroundBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: iconBrightness,
        statusBarBrightness: backgroundBrightness,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarDividerColor: systemNavigationBarColor,
        systemNavigationBarIconBrightness: iconBrightness,
        systemNavigationBarContrastEnforced: false,
      ),
      child: child,
    );
  }
}
