import 'package:financy_app/commom/models/transaction_model.dart';
import 'package:financy_app/commom/widgets/transaction_listview/transaction_listview_state.dart';
import 'package:financy_app/repositories/transaction_repository.dart';
import 'package:flutter/foundation.dart';
//TODO: import states

class TransactionListviewController extends ChangeNotifier {
   final TransactionRepository transactionRepository;

  TransactionListviewController({required this.transactionRepository});

  TransactionListviewState _state = TransactionListviewStateInitial();

  TransactionListviewState get state => _state;

  void _changeState(TransactionListviewState newState) {
   _state = newState;
   notifyListeners();
  }

  Future<void> deleteTransaction(TransactionModel transaction) async{
    _changeState(TransactionListviewStateLoading());
    final result = await transactionRepository.deleteTransaction(transaction.id!);
    if(result){
      _changeState(TransactionListviewStateSuccess());
    } else {
      _changeState(TransactionListviewStateError('It was not possible to delete transaction at this moment. try again latter.'));
    }
  }

}