import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/providers/counter_provider.dart';
import 'package:sample_one/providers/update_provider.dart';
import 'package:sample_one/features/auth/views/login_screen.dart';

class HomePage extends StatefulWidget {
  //mutable
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ourValue = 0;

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<UpdateProvider>();
    final providerRead = context.read<UpdateProvider>();

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
              providerWatch.ourNameValue,
              // '${providerWatch.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerRead.updateName();
          // providerRead.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
