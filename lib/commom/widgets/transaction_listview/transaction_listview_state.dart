abstract class TransactionListviewState {}

class TransactionListviewStateInitial extends TransactionListviewState {}

class TransactionListviewStateLoading extends TransactionListviewState {}

class TransactionListviewStateSuccess extends TransactionListviewState {}

class TransactionListviewStateError extends TransactionListviewState {
  final String message;

  TransactionListviewStateError(this.message);
}