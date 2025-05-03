import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/about_application.dart';
import '../widgets/web_view_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AboutApplication.routeName:
        return MaterialPageRoute(builder: (_) => const AboutApplication());
      case WebViewScreen.routeName:
        final args = settings.arguments as WebViewArguments;
        return MaterialPageRoute(builder: (_) => WebViewScreen(url: args.url));
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}

class Routes {
  static const String home = HomeScreen.routeName;
  static const String aboutApplication = AboutApplication.routeName;
  static const String webView = WebViewScreen.routeName;
}

class WebViewArguments {
  final String url;

  WebViewArguments({required this.url});
}
