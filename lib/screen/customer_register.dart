import 'package:carry_go/constant/color.dart';
import 'package:flutter/material.dart';

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({super.key});

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('CustomerRegister'),
      ),
      body: const Center(
        child: Text('CustomerRegister Screen Content'),
      ),
    );
  }
}
