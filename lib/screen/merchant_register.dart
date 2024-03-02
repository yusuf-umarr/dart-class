import 'package:carry_go/constant/color.dart';
import 'package:flutter/material.dart';

class MerchantRegister extends StatefulWidget {
  const MerchantRegister({super.key});

  @override
  State<MerchantRegister> createState() => _MerchantRegisterState();
}

class _MerchantRegisterState extends State<MerchantRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('MerchantRegister'),
      ),
      body: const Center(
        child: Text('MerchantRegister Screen Content'),
      ),
    );
  }
}
