import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_one/core/constant/api_constant.dart';

class AuthRepository {


  Future<ApiResponse?> signupRepo(
      String name, String email, String password) async {
    try {
      var uri = Uri.parse("https://behemoth-api-vercel.vercel.app/auth/signup");

      //name, email, password ==payload

      var body = jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      });
      final headers = {'Content-Type': 'application/json'};

      var response = await http.post(uri, body: body, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('Success Response body: ${response.body}');
        ////successfull

        return ApiResponse(
          isError: false,
          statusCode: response.statusCode,
          data: response.body,
        );
      } else {
        // print('Error Response body: ${response.body}');
        //error
        return ApiResponse(
          isError: true,
          statusCode: response.statusCode,
          data: response.body,
        );
      }
      // return ApiResponse(isError: );
    } catch (e) {
      debugPrint("error :$e");
      return ApiResponse(isError: true, data: "error $e");
    }
  }
//

  Future<ApiResponse?> signInRepo(
      String email, String password) async {
    try {
      var uri = Uri.parse("https://behemoth-api-vercel.vercel.app/auth/signin");

      //name, email, password ==payload

      var body = jsonEncode({
        "email": email,
        "password": password,
      });
      final headers = {'Content-Type': 'application/json'};

      var response = await http.post(uri, body: body, headers: headers);

      if (response.statusCode == 200) {
        // print('Success Response body: ${response.body}');
        ////successfull

        return ApiResponse(
          isError: false,
          statusCode: response.statusCode,
          data: response.body,
        );
      } else {
        // print('Error Response body: ${response.body}');
        //error
        return ApiResponse(
          isError: true,
          statusCode: response.statusCode,
          data: response.body,
        );
      }
      // return ApiResponse(isError: );
    } catch (e) {
      debugPrint("error :$e");
      return ApiResponse(isError: true, data: "error $e");
    }
  }
//

}

class ApiResponse<T> {
  final int? statusCode; //response.statuscode
  final bool isError; //false/true
  final T? data; //response.body

  ApiResponse({
    this.statusCode,
    required this.isError,
    this.data,
  });
}
