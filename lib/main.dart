import 'package:flutter/material.dart';
import 'package:personal_files/core/theme/app_theme.dart';
import 'package:personal_files/models/screen_model.dart';
import 'package:personal_files/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScreenModel()),
      ],
      child: MaterialApp(
        home: const Home(),
        theme: AppTheme.lightTheme,
      ),
    ),
  );
}
