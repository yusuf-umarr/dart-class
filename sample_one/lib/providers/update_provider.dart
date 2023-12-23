import 'package:flutter/material.dart';

class UpdateProvider extends ChangeNotifier {
  String ourNameValue = 'initial value';

  void updateName() {
    print("cliked====");

    ourNameValue = "lawal";
    notifyListeners();
  }
}
