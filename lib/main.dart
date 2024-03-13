import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monopoly_game/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeRoute(),
      getPages: Routes.routes,
    );
  }
}
