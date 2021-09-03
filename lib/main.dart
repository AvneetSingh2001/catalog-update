import 'package:catalog_revision/pages/home_page.dart';
import 'package:catalog_revision/pages/login_page.dart';
import 'package:catalog_revision/utils/routes.dart';
import 'package:catalog_revision/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: Routes.HomePageRoute,
      routes: {
        "/": (context) => LoginPagin(),
        Routes.HomePageRoute: (context) => HomePage(),
        Routes.LoginPageRoute: (context) => LoginPagin(),
      },
    );
  }
}
