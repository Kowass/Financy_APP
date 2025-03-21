import 'package:financy_app/features/home/home_state.dart';
import 'package:flutter/foundation.dart';
//TODO: import states

class HomeController extends ChangeNotifier {
   //TODO: inject service
   //TODO: constructor

  HomeState _state = HomeStateInitial();

  HomeState get state => _state;

  void _changeState(HomeState newState) {
   _state = newState;
   notifyListeners();
  }

}