// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:financy_app/features/sign_in/sign_in_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:financy_app/services/graphql_service.dart';
import 'package:financy_app/services/secure_storage.dart';

class SignInController extends ChangeNotifier {
  final SecureStorage secureStorage;
  final AuthService authService;
  SignInController({
    required this.secureStorage,
    required this.authService,
  });

  SignInState _state = SignInStateInitial();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    _changeState(SignInStateLoading());

    try {
      final user = await authService.signIn(
        email: email,
        password: password,
      );

      if (user.id != null) {
        await secureStorage.write(key: "CURRENT_USER", value: user.toJson());

        _changeState(SignInStateSuccess());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }
}
