import 'package:flutter/material.dart';
import 'package:ojt_irfan/screen/home/view/home_screen.dart';
import 'package:ojt_irfan/utils/constant/path_route.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generatePageList(RouteSettings settings) {
    switch (settings.name) {
      case PathRoute.homeScreen:
        return _generatePageRoute(
          settings,
          (context) => const HomeScreen(),
        );

      default:
        return _generatePageRoute(
          settings,
          (context) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _generatePageRoute(
    RouteSettings settings,
    Widget Function(BuildContext context) builder,
  ) =>
      MaterialPageRoute(builder: builder, settings: settings);
}
