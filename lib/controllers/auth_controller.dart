import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../components/util/custom_return.dart';
import '../data/firebase_consts.dart';
import '../data/local_storage.dart';

class AuthData {
  late String _token;
  late String _email;
  late String _userId;
  late DateTime? _expirationDatetime;

  AuthData({
    required String email,
    required String userId,
    DateTime? expirationDatetime,
    required String token,
  }) {
    _token = token;
    _email = email;
    _userId = userId;
    _expirationDatetime = expirationDatetime;
  }

  static AuthData emptyData() {
    return AuthData(email: '', userId: '', token: '');
  }

  bool get isAuthenticated {
    return (_expirationDatetime?.isAfter(DateTime.now()) ?? false) &&
        _token != '';
  }

  String? get token {
    return isAuthenticated ? _token : '';
  }

  String? get email {
    return isAuthenticated ? _email : '';
  }

  String? get userId {
    return isAuthenticated ? _userId : '';
  }

  DateTime? get expirationDatetime {
    return isAuthenticated ? _expirationDatetime : null;
  }
}

class AuthController with ChangeNotifier {
  late AuthData _authData = AuthData.emptyData();

  void logout() {
    _authData = AuthData.emptyData();
    LocalStorage.removeValue(key: 'authData').then((_) {
      notifyListeners();
    });
  }

  Future<Response> _connectFirebase(
      {required String email,
      required String password,
      required String service}) async {
    final url = FirebaseConsts.authenticationUrl(service);
    return await post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
  }

  Future<CustomReturn> authenticate(
      {required String email, required String password}) async {
    final response = await _connectFirebase(
        email: email, password: password, service: 'signInWithPassword');

    if (response.statusCode >= 400) {
      if (response.statusCode == 404) {
        return CustomReturn(
            returnType: ReturnType.error, message: 'Login service not found');
      } else {
        return CustomReturn.authSignUpError(
            jsonDecode(response.body)['error']['message']);
      }
    }

    final body = jsonDecode(response.body);

    _authData = AuthData(
      email: body['email'],
      userId: body['localId'],
      expirationDatetime: DateTime.now()
          .add(Duration(seconds: int.tryParse(body['expiresIn']) ?? 0)),
      token: body['idToken'],
    );

    LocalStorage.saveMap(
      key: 'authData',
      map: {
        'email': _authData.email,
        'userId': _authData.userId,
        'expirationDatetime': _authData.expirationDatetime!.toIso8601String(),
        'token': _authData.token,
      },
    );

    notifyListeners();
    return CustomReturn.sucess();
  }

  Future<void> tryAutoLogin() async {
    if (!_authData.isAuthenticated) {
      final storedAuthData = await LocalStorage.loadMap(key: 'authData');
      if (storedAuthData.isNotEmpty) {
        final localExpiredDate =
            DateTime.parse(storedAuthData['expirationDatetime']);
        if (localExpiredDate.isAfter(DateTime.now())) {
          _authData = AuthData(
            email: storedAuthData['email'],
            userId: storedAuthData['userId'],
            expirationDatetime: localExpiredDate,
            token: storedAuthData['token'],
          );
        }
      }
    }
  }

  AuthData get authData {
    return _authData;
  }

  Future<CustomReturn> signUp(
      {required String email, required String password}) async {
    final response = await _connectFirebase(
        email: email, password: password, service: 'signUp');

    if (response.statusCode >= 400) {
      if (response.statusCode == 404) {
        return CustomReturn(
            returnType: ReturnType.error, message: 'Sign up service not found');
      } else {
        return CustomReturn.authSignUpError(
            jsonDecode(response.body)['error']['message']);
      }
    }
    return CustomReturn.sucess();
  }
}
