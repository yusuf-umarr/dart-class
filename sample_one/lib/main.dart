import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/features/auth/view_model/auth_view_model.dart';
import 'package:sample_one/providers/counter_provider.dart';
import 'package:sample_one/providers/update_provider.dart';
import 'package:sample_one/features/auth/views/signup_screen.dart';
// import 'package:flutter/cupertino.dart'; for ios

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterProvider()),
      ChangeNotifierProvider(create: (_) => UpdateProvider()),
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
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

