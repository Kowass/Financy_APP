import 'package:financy_app/features/sign_in/sign_in_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/foundation.dart';
//TODO: import states

class SignInController extends ChangeNotifier {
  final AuthService _service;
  SignInController(this._service);

  SignInState _state = SignInStateInitial();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signIn({required String email, required String password}) async {
    final secureStorage = const SecureStorage();
    _changeState(SignInStateLoading());

    try {
      final user = await _service.signIn(email: email, password: password);

      if(user.id != null){
        secureStorage.write(key: "CURRENT_USER", value: user.toJson());
      _changeState(SignInStateSuccess());
      }else{
        throw Exception();
      }
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }
}
