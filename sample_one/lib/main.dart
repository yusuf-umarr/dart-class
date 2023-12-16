import 'package:flutter/material.dart';
import 'package:sample_one/screens/design_one.dart';
import 'package:sample_one/screens/login_screen.dart';
import 'package:sample_one/screens/new_screen_one.dart';
import 'package:sample_one/screens/onboard_screen.dart';
import 'package:sample_one/screens/screen_two.dart';
// import 'package:flutter/cupertino.dart'; for ios

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //immutable

  MyApp({super.key, this.name = "yus"});

  // This widget is the root of your application.

  String name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter sample 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

//child====

class HomePage extends StatefulWidget {
  //mutable
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  _incrementCounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home app bar"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()));
              },
              icon: Icon(Icons.login))
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
