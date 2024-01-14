import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_one/core/constant/api_constant.dart';
import 'package:sample_one/features/home/models/comment_model.dart';

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
      final headers = {
        'Content-Type': 'application/json',
      };

      var response = await http.post(uri, body: body, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        ////successfull

        return ApiResponse(
          isError: false,
          statusCode: response.statusCode,
          data: response.body,
        );
      } else {
        //error
        return ApiResponse(
          isError: true,
          statusCode: response.statusCode,
          data: response.body,
        );
      }
    } catch (e) {
      debugPrint("error :$e");
      return ApiResponse(isError: true, data: "error $e");
    }
  }
//

  Future<ApiResponse?> signInRepo(String email, String password) async {
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

  Future<ApiResponse<List<CommentModel>>> getComment() async {
    print("comment called");
    try {
      var uri =
          Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments");

      final headers = {'Content-Type': 'application/json'};

      var response = await http.get(uri, headers: headers);
      final commentModel = commentModelFromJson(response.body);

      //jsonEncode(respose.body)

      if (response.statusCode == 200) {
        // print("success res ${response.body}");

        return ApiResponse(
          isError: false,
          statusCode: response.statusCode,
          data: commentModel,

          //
        );
      } else {
        // print("error res ${response.body}");

        return ApiResponse(
          isError: true,
          statusCode: response.statusCode,
          data: commentModel,
        );
      }
    } catch (e) {
      List<CommentModel> comment = [];
      return ApiResponse(isError: false, statusCode: 500, data: comment);
    }
  }
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
