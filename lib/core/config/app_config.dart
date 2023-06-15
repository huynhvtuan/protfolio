import 'package:flutter/material.dart';
import 'package:protfolio/core/config/others/app_typography.dart';
import 'package:protfolio/core/config/others/space.dart';

class AppConfig {
  // static bool? isLtr;
  // static bool showAds = false;

  static init(BuildContext context) {
    // UI.init(context);
    // AppDimensions.init();
    // AppTheme.init(context);
    // UIProps.init();
    Space.init();
    AppText.init();
    // isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
