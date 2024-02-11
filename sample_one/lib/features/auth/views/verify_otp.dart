import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/common_widgets/custom_btn.dart';
import 'package:sample_one/common_widgets/custom_textfield.dart';
import 'package:sample_one/core/app_color.dart';
import 'package:sample_one/features/auth/view_model/auth_view_model.dart';
import 'package:sample_one/providers/counter_provider.dart';
import 'package:sample_one/features/home/views/screen_two.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String? email;
  VerifyOtpScreen({super.key, this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController pinController = TextEditingController();

  String currentText = "";
  @override
  Widget build(BuildContext context) {
    log("email from login:${widget.email}");
    final providerWatch = context.watch<CounterProvider>();
    final providerRead = context.read<CounterProvider>();
    final authProvider = context.read<AuthViewModel>();
    final authProviderWatch = context.watch<AuthViewModel>();
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
              icon: const Icon(Icons.login))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
            .copyWith(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Verify your account ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Enter the opt code",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreyColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "to verify your account",
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
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,

                pinTheme: PinTheme(
                  inactiveColor: Colors.blue,
                  inactiveFillColor: Colors.white,
                  activeColor: Colors.grey.withOpacity(0.5),
                  selectedColor: Colors.grey.withOpacity(0.5),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                // backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                // errorAnimationController: errorController,
                controller: pinController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                btnName: authProviderWatch.state == AuthState.loading
                    ? "Please wait ..."
                    : "Verify",
                textColor: Colors.white,
                btnColor: Colors.blue,
                onPressed: () {
                  log("pinController.text:${pinController.text}");
                  authProvider.verifyOtpLogic(
                    pinController.text,
                    context,
                  );
                  pinController.clear();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
