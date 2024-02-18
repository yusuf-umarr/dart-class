import 'package:flutter/material.dart';
import 'package:project_update/auth/auth_view_model.dart';
import 'package:project_update/features/podcast/sceens/home.dart';
import 'package:project_update/features/task/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: const MaterialApp(
        home: PodCastHome(),
      ),
    ),
  );
}
