import 'package:flutter/material.dart';
import 'package:project_update/auth/auth_repository.dart';
import 'package:project_update/models/school_model.dart';

enum AuthState { idle, loading, success, error }

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  List<SchoolModel> _allSchools = [];
  List<SchoolModel> _searchResults = [];
  List<SchoolModel> get allSchool => _allSchools;

  AuthState _state = AuthState.idle;
  AuthState get state => _state;

  setAuthState(AuthState state) {
    _state = state;
    notifyListeners();
  }

  setSchool(List<SchoolModel> school) {
    _allSchools = school;

    notifyListeners();
  }

  setSearchResults(List<SchoolModel> results) {
    _searchResults = results;
    notifyListeners();
  }

  setSearch(List<SchoolModel> school) {
    _allSchools = school;

    notifyListeners();
  }

  void getSchools() async {
    var response = await _authRepository.getSchool();

    if (response.statusCode == 200) {
      // print(response.data);
      setSchool(response.data!);
      setAuthState(AuthState.success);
    } else {
      print(response.data);
      setAuthState(AuthState.error);
    }
    notifyListeners();
  }

  void getSearchItem(String query) async {
    print('Show Search Item');
    setAuthState(AuthState.loading);

    if (query.isEmpty) {
      setSchool(List.from(_allSchools)); // Restore all schools
      setAuthState(AuthState.success);
      return;
    }

    var response = await _authRepository.getSearch();

    if (response.statusCode == 200) {
      final List<SchoolModel> allSchools = response.data!;

      if (query.isNotEmpty) {
        // Filter schools based on the search query
        _allSchools = allSchools
            .where((school) =>
                school.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        // If the query is empty, display all schools
        _allSchools = List.from(allSchools);
      }

      setAuthState(AuthState.success);
    } else {
      print(response.data);
      setAuthState(AuthState.error);
    }

    notifyListeners();
  }

  void closeSearch() {
    setSearchResults([]);
    setAuthState(AuthState.success);
  }
}
