import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_one/core/constant/api_constant.dart';

class AuthRepository {
  Future signupRepo(String name, String email, String password) async {
    try {
      var uri = Uri.parse("${ApiConstant.authBaseUrl}auth/signup");

      //name, email, password ==payload

      var body = jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      });
      final headers = {'Content-Type': 'application/json'};
      var response = await http.post(uri, body: body, headers: headers);

      if (response.statusCode == 200) {
        print('Success Response body: ${response.body}');
      } else {
        print('Error Response body: ${response.body}');
      }
      return response.statusCode;
    } catch (e) {
      debugPrint("error :$e");
      return e.toString();
    }
  }
}
