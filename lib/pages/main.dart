import 'package:flutter/material.dart';
import 'package:sample/pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/utils/routes.dart';
import 'package:sample/widgets/theme.dart';
import 'homepage.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeroutes,
      routes: {
        "/": (context) => loginpage(),
        MyRoutes.homeroutes: (context) => homepage(),
        MyRoutes.loginroutes: (context) => loginpage()
      },
    );
  }
}
