import 'package:carry_go/constant/color.dart';
import 'package:flutter/material.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Request Screen Content'),
    );
  }
}
