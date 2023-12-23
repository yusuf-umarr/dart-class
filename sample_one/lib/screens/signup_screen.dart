import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/common_widgets/custom_btn.dart';
import 'package:sample_one/common_widgets/custom_textfield.dart';
import 'package:sample_one/providers/counter_provider.dart';
import 'package:sample_one/screens/screen_two.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _signupkey = GlobalKey<FormState>();
  // String userIputName = "";

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<CounterProvider>();
    final providerRead = context.read<CounterProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset("assets/arrow_back_btn.png")),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ScreenTwo()));
              },
              icon: Icon(Icons.login))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
            .copyWith(top: 50),
        child: SingleChildScrollView(
          child: Form(
            key: _signupkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's Register you ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Register now ",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Join our community!",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text("ourName value:${nameFromHomeScreen}"),
                const SizedBox(
                  height: 20,
                ),
                //
                CustomTextField(
                  hint: "Enter name",
                  controller: nameController,
                  prefix: const Icon(Icons.person),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return '*This name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hint: "Enter email",
                  controller: emailController,
                  prefix: const Icon(Icons.mail_outline_outlined),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return '*This email is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hint: "Enter password",
                  visibility: providerWatch.isVisibility,
                  controller: passwordController,
                  prefix: const Icon(Icons.lock_open_outlined),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return '*This paasword is required';
                    }
                    return null;
                  },
                  suffix: IconButton(
                      onPressed: () {
                        providerRead.togglePassword();
                      },
                      icon: Icon(
                        providerWatch.isVisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  btnName: providerWatch.state == AuthState.loading
                      ? "Please wait ..."
                      : "Signup",
                  textColor: Colors.white,
                  btnColor: Colors.blue,
                  onPressed: () {
                    // final _providerRead = context.read<CounterProvider>();

                    if (_signupkey.currentState!.validate()) {
                      providerRead.register(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        context,
                      );
                      //
                      print("every form in valid");
                    } else {
                      print("every thing not valid");
                    }

                    // providerRead.login(
                    //   emailController.text,
                    //   passwordController.text,
                    //   context,
                    // );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
