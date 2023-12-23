import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/providers/counter_provider.dart';
import 'package:sample_one/providers/update_provider.dart';
import 'package:sample_one/screens/design_one.dart';
import 'package:sample_one/screens/home_page.dart';
import 'package:sample_one/screens/login_screen.dart';
import 'package:sample_one/screens/new_screen_one.dart';
import 'package:sample_one/screens/onboard_screen.dart';
import 'package:sample_one/screens/screen_two.dart';
import 'package:sample_one/screens/signup_screen.dart';
// import 'package:flutter/cupertino.dart'; for ios

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterProvider()),
      ChangeNotifierProvider(create: (_) => UpdateProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  //immutable

  MyApp({super.key, this.name = "yus"});

  String name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter sample 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUpScreen(),
    );
  }
}

//child====

