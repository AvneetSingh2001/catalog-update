import 'package:catalog_revision/pages/home_page.dart';
import 'package:catalog_revision/pages/login_page.dart';
import 'package:catalog_revision/utils/routes.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: Routes.LoginPageRoute,
      routes: {
        "/": (context) => LoginPagin(),
        Routes.HomePageRoute: (context) => HomePage(),
        Routes.LoginPageRoute: (context) => LoginPagin(),
      },
    );
  }
}
