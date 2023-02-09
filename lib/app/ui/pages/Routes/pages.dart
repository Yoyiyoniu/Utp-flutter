import 'package:flutter/widgets.dart';
import 'package:utp/app/ui/pages/Options/options.dart';
import 'package:utp/app/ui/pages/Permissions_Pages/RequestPermission.dart';
import 'package:utp/app/ui/pages/Routes/Routes.dart';
import 'package:utp/app/ui/pages/Splash/splash.dart';
import 'package:utp/app/ui/pages/home/home_Page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermission(),
    Routes.HOME: (_) => const HomePage(),
    Routes.OPTIONS: (_) => const Options(),
  };
}
