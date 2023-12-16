import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_one/common_widgets/custom_btn.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen two"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const ListTile(
              leading: Text("s/n"),
              title: Text("product 1"),
              trailing: Text("20"),
            ),
            const Divider(
              color: Colors.green,
            ),
            const ListTile(
              leading: Text("1"),
              title: Text("product 1"),
              trailing: Text("20"),
            ),
            const ListTile(
              leading: Text("2"),
              title: Text("product 1"),
              trailing: Text("20"),
            ),
            const ListTile(
              leading: Text("3"),
              title: Text("product 1"),
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
            CustomButton(
              btnName: "Checkout",
              textColor: Colors.white,
              btnColor: Colors.blue,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
