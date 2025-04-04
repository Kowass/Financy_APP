import 'package:financy_app/commom/models/transaction_model.dart';
import 'package:financy_app/features/wallet/wallet_state.dart';
import 'package:financy_app/repositories/transaction_repository.dart';
import 'package:flutter/foundation.dart';
//TODO: import states

class WalletController extends ChangeNotifier {
   final TransactionRepository transactionRepository;

  WalletController({required this.transactionRepository});

  WalletState _state = WalletStateInitial();

  WalletState get state => _state;

  
  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  int get _limit => 10;
  int get _offset => transactions.isEmpty ? 0 : transactions.length;

  bool _isLoading = false;

  bool get isLoading{
    return _isLoading;
  }

  void _changeState(WalletState newState) {
   _state = newState;
   notifyListeners();
  }

  Future<void> getAllTransactions() async {
    _changeState(WalletStateLoading());
    try {
      if(transactions.isNotEmpty){
        transactions.clear();
      }
      _transactions = await transactionRepository.getAllTransactions(limit: _limit, offset: _offset);

      if(_offset >= _limit){
        _isLoading = true;
      }
      _changeState(WalletStateSuccess());
    } catch (e) {
      _changeState(WalletStateError());
    }
  }

  void get fetchMore async{
    try {
      if(isLoading){
        final result = await transactionRepository.getAllTransactions(limit: _limit, offset: _offset);
        if(result.isNotEmpty){
          _transactions.addAll(result);
        } else {
          _isLoading = false;
        }
      }
      _changeState(WalletStateSuccess());
    } catch (e) {
      _changeState(WalletStateError());
    }
  }
}