import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_one/features/auth/view_model/auth_view_model.dart';
import 'package:sample_one/features/auth/views/signup_screen.dart';
import 'package:sample_one/features/home/views/screen_two.dart';

class AuthCheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: Provider.of<AuthViewModel>(context, listen: false).validateToken().asStream(),
        builder: (context, val) {
          if (val.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );


          } else if (val.hasError) {
            return Center(
              child: Text('Error: ${val.error}'),
            );
          } else {

            final bool isTokenValid = val.data ?? false;

            if (isTokenValid) {
              return  ScreenTwo();
            } else {
              return  SignUpScreen();
            }
          }
        },
      ),
    );
  }
}
