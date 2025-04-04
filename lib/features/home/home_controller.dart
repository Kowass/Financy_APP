import 'package:financy_app/commom/models/transaction_model.dart';
import 'package:financy_app/features/home/home_state.dart';
import 'package:financy_app/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;
  HomeController(this._transactionRepository);

  HomeState _state = HomeStateInitial();

  HomeState get state => _state;

  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  late PageController _pageController;
  PageController get pageController => _pageController;

  set setPageController(PageController newPageController) {
    _pageController = newPageController;
  }

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getLatestTransactions() async {
    _changeState(HomeStateLoading());

    try {
      _transactions = await _transactionRepository.getAllTransactions(limit: 10, offset: 0);
      _changeState(HomeStateSuccess());
    } catch (e) {
      _changeState(HomeStateError());
    }
  }
}
