import 'package:clients_list/core/theme/app_theme.dart';
import 'package:clients_list/model/screen_model.dart';
import 'package:clients_list/screens/home.dart';
import 'package:flutter/material.dart';
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
