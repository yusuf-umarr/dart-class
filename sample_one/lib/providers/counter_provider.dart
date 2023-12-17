import 'package:flutter/material.dart';
import 'package:sample_one/screens/screen_two.dart';

enum AuthState { idle, loading, success, error }

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  String _productOne = "product One";
  String get productOne => _productOne;

  bool _isActive = false;
  bool get isActive => _isActive;

  bool _isVisibility = true;
  bool get isVisibility => _isVisibility;

  String _email = "";
  String get email => _email;

  String _password = "";
  String get password => _password;

  AuthState _state = AuthState.idle;
  AuthState get state => _state;

  setAuthState(AuthState state) {
    _state = state;
    notifyListeners();
  }

  incrementCounter() {
    _counter = _counter + 1;

    notifyListeners();
  }

  decrementCounter() {
    _counter = _counter - 1;

    print("counter value:$_counter");
  }

  void updateProductOne() {
    _productOne = "new product";
    notifyListeners();
  }

  void toggleColor() {
    _isActive = !_isActive;

    print("_isActive valeue:$_isActive");

    notifyListeners();
  }

  void login(String emailInput, String passwordInput, context) {
    setAuthState(AuthState.loading);

    _email = emailInput;
    _password = passwordInput;

    Future.delayed(const Duration(seconds: 3), () {
      if (_email == "yoo@gmail.com" && password == "ade12345") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => ScreenTwo()),
        );
        setAuthState(AuthState.success);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.grey,
            content: Text(
              "Invalid email or password",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        setAuthState(AuthState.error);
      }
    });

    notifyListeners();
  }

  void togglePassword() {
    _isVisibility = !_isVisibility;
    notifyListeners();
  }
}
