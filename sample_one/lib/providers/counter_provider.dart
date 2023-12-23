import 'package:flutter/material.dart';
import 'package:sample_one/screens/login_screen.dart';
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

  String _name = '';
  String get name => _name;

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

  void login(
    String emailInput,
    String passwordInput,
    BuildContext context,
  ) {
    setAuthState(AuthState.loading);

    Future.delayed(const Duration(seconds: 3), () {
      if (_email == emailInput.trim() && password == passwordInput.trim()) {
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

  void register(
    String userName,
    String userEmail,
    String userPassword,
    BuildContext context,
  ) {
    setAuthState(AuthState.loading);
    //saving user datils to the state provider
    _name = userName.trim();
    _email = userEmail.trim();
    _password = userPassword.trim();

    Future.delayed(Duration(seconds: 3), () {
      if (userPassword.length >= 6) {
        setAuthState(AuthState.success);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        setAuthState(AuthState.error);
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
