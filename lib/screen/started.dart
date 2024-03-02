import 'dart:developer';

import 'package:carry_go/constant/color.dart';
import 'package:carry_go/screen/customer_register.dart';
import 'package:carry_go/screen/login.dart';
import 'package:carry_go/screen/merchant_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AccountTypeEnum {
  Idle,
  Customer,
  Merchant,
}

class Started extends StatefulWidget {
  const Started({Key? key});

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  AccountTypeEnum? _accountTypeEnum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
          bottom: 40,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/start.svg',
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Get Started !',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Your journey begins here !',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SelectAccountType(
                        accountTypeEnum: _accountTypeEnum,
                      );
                    },
                  );
                },
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryColor,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectAccountType extends StatefulWidget {
  dynamic accountTypeEnum;
  SelectAccountType({super.key, this.accountTypeEnum});

  @override
  State<SelectAccountType> createState() => _SelectAccountTypeState();
}

class _SelectAccountTypeState extends State<SelectAccountType> {
  //AccountTypeEnum.Merchant
  int selectedValue = 0;

  List accountTypeList = [0, 1];

  saveAccountType(int acct) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("accountType", acct);
  }


   getAccountType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedValue = prefs.getInt("accountType")??0;
    });

    log("accountType:$selectedValue");
  }

  @override
  void initState() {
    getAccountType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account Type Selection',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.dark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'x',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Tailored Solutions for Every Journey; Choose Your Account Type Today!',
                style: TextStyle(color: AppColors.dark),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ...accountTypeList.map(
                    (e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedValue = e;
                              saveAccountType(e);
                            });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e == 0 ? 'Merchant' : "Customer"),
                                  Radio(
                                    value: accountTypeList.indexOf(e),
                                    groupValue: selectedValue,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedValue = e!;
                                        saveAccountType(e);
                                      });
                                    },
                                    activeColor: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: handleProceedButton,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor,
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Proceed',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleProceedButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }
}
