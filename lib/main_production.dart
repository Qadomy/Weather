import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_warba_bank/weather_warba_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() async {
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  // await CacheHelper.init();
  setupServiceLocator();
  runApp(
    WeatherWarbaApp(
      appRouter: AppRouter(),
    ),
  );
}
