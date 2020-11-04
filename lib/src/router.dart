import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_example/src/views/pages/home_page.dart';
import 'package:mvvm_example/src/views/pages/login_page.dart';
import 'package:mvvm_example/src/views/pages/post_page.dart';

import 'common/route_paths.dart';
import 'models/post.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutePaths.Post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostPage(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
