import 'package:flutter/material.dart';
import 'package:sample_one/features/auth/views/login_screen.dart';
import 'package:sample_one/features/home/views/screen_two.dart';

enum CounterState { idle, loading, success, error }

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

  String _name = '';
  String get name => _name;

  CounterState _state = CounterState.idle;
  CounterState get state => _state;

  setCounterState(CounterState state) {
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

  void login(
    String emailInput,
    String passwordInput,
    BuildContext context,
  ) {
    setCounterState(CounterState.loading);

    Future.delayed(const Duration(seconds: 3), () {
      if (_email == emailInput.trim() && password == passwordInput.trim()) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => ScreenTwo()),
        );
        setCounterState(CounterState.success);
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
        setCounterState(CounterState.error);
      }
    });

    notifyListeners();
  }

  void register(
    String userName,
    String userEmail,
    String userPassword,
    BuildContext context,
  ) {
    setCounterState(CounterState.loading);
    //saving user datils to the state provider
    _name = userName.trim();
    _email = userEmail.trim();
    _password = userPassword.trim();

    Future.delayed(Duration(seconds: 3), () {
      if (userPassword.length >= 6) {
        setCounterState(CounterState.success);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        setCounterState(CounterState.error);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.grey,
            content: Text(
              "Password not valid ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    });
    notifyListeners();
  }

  void togglePassword() {
    _isVisibility = !_isVisibility;
    notifyListeners();
  }
}
