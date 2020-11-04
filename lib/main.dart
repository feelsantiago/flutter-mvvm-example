import 'package:flutter/material.dart';
import 'package:mvvm_example/src/common/route_paths.dart';
import 'package:mvvm_example/src/router.dart';

import 'injection.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePaths.Login,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
