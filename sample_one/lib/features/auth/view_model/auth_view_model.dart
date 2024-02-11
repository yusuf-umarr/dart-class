import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sample_one/features/auth/models/user_model.dart';
import 'package:sample_one/features/auth/repository/auth_repository.dart';
import 'package:sample_one/features/auth/views/login_screen.dart';
import 'package:sample_one/features/auth/views/verify_otp.dart';
import 'package:sample_one/features/home/models/comment_model.dart';
import 'package:sample_one/features/home/views/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { idle, loading, success, error }

class AuthViewModel extends ChangeNotifier {
  AuthRepository _authRepository = AuthRepository();

  List<CommentModel> _allComments = [];
  List<CommentModel> get allComment => _allComments;

  AuthState _state = AuthState.idle;
  AuthState get state => _state;

  UserModel user = UserModel();

  setAuthState(AuthState state) {
    _state = state;
    notifyListeners();
  }

  setComment(List<CommentModel> comment) {
    _allComments = comment;

    notifyListeners();
  }

  void signupLogic(
    String userName,
    String userEmail,
    String userPassword,
    BuildContext context,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', userEmail);

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

    var response = await _authRepository.signupRepo(
      userName.trim(),
      userEmail.trim(),
      userPassword.trim(),
    );

    setAuthState(AuthState.success);
    if (response!.statusCode == 200 || response.statusCode == 201) {
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
            response.data,
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', userEmail);

    var response = await _authRepository.signInRepo(
      userEmail.trim(),
      userPassword.trim(),
    );

    setAuthState(AuthState.success);
    if (response!.statusCode == 200 || response.statusCode == 201) {
      // user = response.data;
      // log("login successful:${user}");
      // log("login successful:${user.token}");

      // log("token :${response.data['token']}");

      await prefs.setString('token', response.data['token']);

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
      print(response.data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            response.data,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    notifyListeners();
  }

//
  void verifyOtpLogic(
    String otp,
    // String email,
    BuildContext context,
  ) async {
    setAuthState(AuthState.loading);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? "";

    // yusuffumar02@gmail.com

    if (email == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            "email not found",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      return;
    }

    var response = await _authRepository.verifyOtpRepo(
      otp.trim(),
      email.trim(),
    );

    setAuthState(AuthState.success);
    if (response!.statusCode == 200 || response.statusCode == 201) {
      // print("login successful");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            "Account verified successful",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      Future.delayed(const Duration(microseconds: 100), () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (BuildContext context) => ScreenTwo()),
        // );
      });

      //take the use to  screen two
    } else {
      setAuthState(AuthState.error);
      print(response.data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            response.data,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    notifyListeners();
  }

//
  void resendyOtpLogic(
    String email,
    BuildContext context,
  ) async {
    setAuthState(AuthState.loading);

    var response = await _authRepository.resendOptRepo(
      email.trim(),
    );

    setAuthState(AuthState.success);
    if (response!.statusCode == 200 || response.statusCode == 201) {
      print("otp resnt =====");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            "Account verified successful",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      Future.delayed(const Duration(microseconds: 100), () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => VerifyOtpScreen(
                      email: email,
                    )),
            (route) => false);

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (BuildContext context) => ScreenTwo()),
        // );
      });

      //take the use to  screen two
    } else {
      setAuthState(AuthState.error);
      print(response.data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            response.data,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    notifyListeners();
  }

//
  void logOut(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
//

  void getComments() async {
    var response = await _authRepository.getComment();

    if (response!.statusCode == 200) {
      // print(response.data);
      setComment(response.data!);
    } else {
      print(response.data);
    }
    notifyListeners();
  }
//



  Future<bool> validateToken() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";

  
    try {
      if (token != "") {
        return true; // Token is valid
      } else {
        return false; // Token is invalid
      }
    } catch (e) {
      debugPrint('Error validating token: $e');
      return false; // Error occurred during validation
    }
  }

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