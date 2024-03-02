import 'package:carry_go/model/onboarding_model.dart';
import 'package:carry_go/model/screen_model.dart';
import 'package:carry_go/screen/on_boarding_screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScreenModel()),
        ChangeNotifierProvider(create: (_) => OnBoardingModel()),
      ],
      child: const MaterialApp(
        home: Onboarding(),
      ),
    ),
  );
}
