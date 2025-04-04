import 'package:financy_app/features/splash/splash_state.dart';
import 'package:financy_app/services/graphql_service.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/foundation.dart';
//TODO: import states

class SplashController extends ChangeNotifier {
  final GraphQLService graphQLService;
  final SecureStorage secureStorage;

  SplashController({required this.secureStorage, required this.graphQLService});

  SplashState _state = SplashStateInitial();

  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    final result = await secureStorage.readOne(key: "CURRENT_USER");

    if (result != null) {
      await graphQLService.init();
      _changeState(SplashStateSuccess());
    } else {
      _changeState(SplashStateError());
    }
  }
}
