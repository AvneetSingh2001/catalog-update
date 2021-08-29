import 'package:catalog_revision/pages/home_page.dart';
import 'package:catalog_revision/pages/login_page.dart';
import 'package:catalog_revision/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: Routes.HomePageRoute,
      routes: {
        "/": (context) => LoginPagin(),
        Routes.HomePageRoute: (context) => HomePage(),
        Routes.LoginPageRoute: (context) => LoginPagin(),
      },
    );
  }
}
