import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesignOne extends StatelessWidget {
  const DesignOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text("Hey, Kurproy Jane"),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/login-img.png",
                  ),
                  radius: 20,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Choose your Fav Class"),
            const Expanded(
                child: SizedBox(
              height: 20,
            )),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 114, 147, 174)),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 20,
                      width: 150,
                      color: const Color.fromARGB(255, 223, 220, 220),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 20,
                      width: 150,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(20),
                          ),
                          color: Color.fromARGB(255, 114, 147, 174)),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 20,
                      width: 150,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(10),
                          ),
                          color: Color.fromARGB(255, 114, 147, 174)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  
}
