import 'package:flutter/material.dart';
import 'package:sample_one/features/auth/repository/auth_repository.dart';
import 'package:sample_one/features/auth/views/login_screen.dart';
import 'package:sample_one/features/home/views/screen_two.dart';

enum AuthState { idle, loading, success, error }

class AuthViewModel extends ChangeNotifier {
  AuthRepository _authRepository = AuthRepository();

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

  void signupLogic(
    String userName,
    String userEmail,
    String userPassword,
    BuildContext context,
  ) async {
    setAuthState(AuthState.loading);
    if (userPassword.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            "Password should be minimum of 6 chars",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      setAuthState(AuthState.error);
      return;
    }

    var repsonse = await _authRepository.signupRepo(
      userName.trim(),
      userEmail.trim(),
      userPassword.trim(),
    );

    setAuthState(AuthState.success);
    if (repsonse!.statusCode == 200 || repsonse.statusCode == 201) {
      print("registration successful");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            "registration successful",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      Future.delayed(const Duration(microseconds: 100), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });

      //take the use to login screen
    } else {
      setAuthState(AuthState.error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            repsonse.data,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    notifyListeners();
  }
//

  void signInLogic(
    String userEmail,
    String userPassword,
    BuildContext context,
  ) async {
    setAuthState(AuthState.loading);

    var repsonse = await _authRepository.signInRepo(
      userEmail.trim(),
      userPassword.trim(),
    );

    setAuthState(AuthState.success);
    if (repsonse!.statusCode == 200 || repsonse.statusCode == 201) {
      print("login successful");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            "login successful",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      Future.delayed(const Duration(microseconds: 100), () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ScreenTwo()),
            (route) => false);

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (BuildContext context) => ScreenTwo()),
        // );
      });

      //take the use to  screen two
    } else {
      setAuthState(AuthState.error);
      print(repsonse.data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            repsonse.data,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    notifyListeners();
  }

  void logOut(context){

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);

  }
//
}


/*

M V VM

View (Screen)
ViewModel(Controller/logic class)
Service (repository/interracting with the backend/database)


view-----SCREEN -> controller---logic -> auth-repository ====backend/database

response 200/201



 view-----SCREEN <--controller---logic  <---auth-repository (success, error)    <<<< backend


success = {
"name":"yusuf",
"email":"yusuf@gmail.com",
"password":"$2a$08$U8GftDpjsdQBvqN1xoVvzeXbldM2q8ZbtdIxUnf5WWSySMi1FJItK",
"isVerified":false,
"oneSignalId":"",
"phoneNumber":"",
"_id":"65a25b395fa92a1292663e4f","__v":0
}

errro =  "User with same email already exists!"
///
///
///

*/