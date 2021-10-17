import 'package:e_commerce_app/config/app_router.dart';
import 'package:e_commerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Demo',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
