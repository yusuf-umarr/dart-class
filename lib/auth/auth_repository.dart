import 'package:http/http.dart' as http;
import 'package:project_update/models/school_model.dart';

class AuthRepository {
  Future<ApiResponse<List<SchoolModel>>> getSchool() async {
    print('Schools called');
    try {
      var uri = Uri.parse(
        'http://universities.hipolabs.com/search?country=United+States',
      );
      final headers = {'Content-Type': 'application/json'};

      var response = await http.get(uri, headers: headers);
      final schoolModel = schoolModelFromJson(response.body);

      if (response.statusCode == 200) {
        print(schoolModel);

        return ApiResponse(
          isError: false,
          statusCode: response.statusCode,
          data: schoolModel,
        );
      } else {
        return ApiResponse(
          isError: true,
          statusCode: response.statusCode,
          data: [],
        );
      }
    } catch (e) {
      return ApiResponse(
        isError: true,
        statusCode: 500,
        data: [],
      );
    }
  }

  Future<ApiResponse<List<SchoolModel>>> getSearch() async {
    print('show search');
    try {
      var uri = Uri.parse(
        'http://universities.hipolabs.com/search?country=United+States',
      );
      final headers = {'Content-Type': 'application/json'};

      var response = await http.get(uri, headers: headers);
      final schoolModel = schoolModelFromJson(response.body);

      if (response.statusCode == 200) {
        print(schoolModel);

        return ApiResponse(
          isError: false,
          statusCode: response.statusCode,
          data: schoolModel,
        );
      } else {
        return ApiResponse(
          isError: true,
          statusCode: response.statusCode,
          data: [],
        );
      }
    } catch (e) {
      return ApiResponse(
        isError: true,
        statusCode: 500,
        data: [],
      );
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
