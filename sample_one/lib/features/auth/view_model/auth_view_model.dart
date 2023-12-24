import 'package:flutter/material.dart';
import 'package:sample_one/features/auth/repository/auth_repository.dart';
import 'package:sample_one/features/auth/views/login_screen.dart';

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
      //saving user datils to the state provider
      _name = userName.trim();
      _email = userEmail.trim();
      _password = userPassword.trim();

      var repsonse = await _authRepository.signupRepo(
        userName.trim(),
        userEmail.trim(),
        userPassword.trim(),
      );

       setAuthState(AuthState.success);



      // if (repsonse.data.statusCode == 200) {
      //   print("register successful");

      //   //take the use to login screen
      // }else{
      //     setAuthState(AuthState.error);
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         backgroundColor: Colors.grey,
      //         content: Text(
      //           "Password not valid ",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     );
        
      // }

      // Future.delayed(Duration(seconds: 3), () {
      //   if (userPassword.length >= 6) {
      //     setAuthState(AuthState.success);
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //   } else {
      //     setAuthState(AuthState.error);
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         backgroundColor: Colors.grey,
      //         content: Text(
      //           "Password not valid ",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     );
      //   }
      // });
      notifyListeners();
    }
  }


/*


view-----SCREEN -> controller---logic -> auth-repository ====backend/database



 view-----SCREEN <--controller---logic  <---auth-repository     <<<<

///
///
///

*/