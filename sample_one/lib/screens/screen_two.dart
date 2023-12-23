import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/common_widgets/custom_btn.dart';
import 'package:sample_one/providers/counter_provider.dart';
import 'package:sample_one/providers/update_provider.dart';

class ScreenTwo extends StatelessWidget {
  ScreenTwo({super.key});

  List ourNumber = [
    {"productName": "book", "price": "200"},
    {"productName": "pen", "price": "50"},
    {"productName": "cloth", "price": "10"},
    {"productName": "laptop", "price": "200"},
    {"productName": "bag", "price": "60"},
    {"productName": "phone", "price": "20"},
  ];

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<CounterProvider>();
    final providerRead = context.read<CounterProvider>();
    final updateProviderWatch = context.watch<UpdateProvider>();
    final updateProviderRead = context.read<UpdateProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen two"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("global state value:${updateProviderWatch.ourNameValue}"),
            const ListTile(
              leading: Text("s/n"),
              title: Text("products"),
              trailing: Text("20"),
            ),
            const Divider(
              color: Colors.green,
            ),
            ListTile(
              leading: const Text("1"),
              title: Text(providerWatch.productOne),
              trailing: InkWell(
                  onTap: () {
                    providerRead.updateProductOne();
                  },
                  child: Text("update")),
            ),
            const ListTile(
              leading: Text("2"),
              title: Text("product 2"),
              trailing: Text("20"),
            ),
            const ListTile(
              leading: Text("3"),
              title: Text("product 3"),
              trailing: Text("20"),
            ),
            const Divider(
              color: Colors.green,
              // thickness: 10,
              // height: 20,
              indent: 20,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/login-img.png',
              ),
              backgroundColor: Colors.red,
              radius: 50,
            ),
            const SizedBox(
              height: 30,
            ),
            // Text("screen two counter:${providerWatch.counter}"),

            Text("email: ${providerWatch.email}"),
            Text("password: ${providerWatch.password}"),
            CustomButton(
              btnName: "Decrement",
              textColor: Colors.white,
              btnColor: providerWatch.isActive ? Colors.blue : Colors.red,
              onPressed: () {
                // providerRead.decrementCounter();
                // providerRead.toggleColor();

                updateProviderRead.updateName();
              },
            )
          ],
        ),
      ),
    );
  }
}
