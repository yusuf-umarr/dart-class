import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/features/auth/view_model/auth_view_model.dart';
import 'package:sample_one/features/auth_check.dart';
import 'package:sample_one/features/home/views/screen_two.dart';
import 'package:sample_one/providers/counter_provider.dart';
import 'package:sample_one/providers/update_provider.dart';
import 'package:sample_one/features/auth/views/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/cupertino.dart'; for ios

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterProvider()),
      ChangeNotifierProvider(create: (_) => UpdateProvider()),
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  //immutable

  MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  String? token;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter sample 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthCheckScreen(),
    );
  }
}




//child====

