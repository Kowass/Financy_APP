import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpIntialState();
  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    _changeState(SignUpLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    _changeState(SignUpSuccessState());
    return true;
  }
}
