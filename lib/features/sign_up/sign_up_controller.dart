// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financy_app/services/graphql_service.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:financy_app/services/secure_storage.dart';

class SignUpController extends ChangeNotifier {
  final AuthService service;
  final SecureStorage secureStorage;
  final GraphQLService graphQLClient;
  SignUpController({
    required this.service,
    required this.secureStorage,
    required this.graphQLClient,
  });

  SignUpState _state = SignUpStateIntial();
  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _changeState(SignUpStateLoading());

    try {
      final user = await service.signUp(
        name: name,
        email: email,
        password: password,
      );
      if (user.id != null) {
        await secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );
        await graphQLClient.init();
        _changeState(SignUpStateSuccess());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignUpStateError(e.toString()));
    }
  }
}
