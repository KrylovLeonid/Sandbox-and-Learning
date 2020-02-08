import 'dart:io';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//make own firebase api to test
import 'package:common_shop_app/Keys.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_token != null && _expiryDate.isAfter(DateTime.now())) return _token;
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String requestType) async {
    final endPoint =
        "https://identitytoolkit.googleapis.com/v1/accounts:$requestType?key=${Keys.key}";

    try {
      final response = await http.post(endPoint,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      print(responseData["idToken"]);
      print(responseData["localId"]);
      print(responseData["expiresIn"]);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData["idToken"];
      _userId = responseData["localId"];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData["expiresIn"])));
    } catch (error) {
      throw (error);
    }
    _autoLogout();
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  void logout(){
    _token = null;
    _userId =null;
    _expiryDate = null;
    notifyListeners();
    if(_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
  }
  void _autoLogout(){
    if(_authTimer != null)
      _authTimer.cancel();

    final _tumeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: _tumeToExpiry), logout );

  }
}
