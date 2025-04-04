import 'package:financy_app/commom/constants/mutations/add_new_transactions.dart';
import 'package:financy_app/commom/constants/mutations/update_transaction.dart';
import 'package:financy_app/commom/constants/queries/get_all_transactions.dart';
import 'package:financy_app/commom/constants/queries/get_balances.dart';
import 'package:financy_app/commom/constants/queries/get_latest_transactions.dart';
import 'package:financy_app/commom/models/balances_model.dart';
import 'package:financy_app/commom/models/transaction_model.dart';
import 'package:financy_app/locator.dart';
import 'package:financy_app/services/api_service.dart';
import 'package:financy_app/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class TransactionRepository {
  Future<bool> addTransaction(
    TransactionModel transaction,
    String userId,
  );

  Future<bool> updateTransaction(TransactionModel transaction);

  Future<List<TransactionModel>> getAllTransactions({
    required int limit,
    required int offset,
  });

  Future<List<TransactionModel>> getLatestTransactions();

  Future<BalancesModel> getBalances();
}

class TransactionRepositoryImpl implements TransactionRepository {
  final ApiService<GraphQLClient, QueryResult> graphqlService;

  TransactionRepositoryImpl({
    required this.graphqlService,
  });

  @override
  Future<bool> addTransaction(
    TransactionModel transaction,
    String userId,
  ) async {
    try {
      final response = await graphqlService.create(params: {
        "category": transaction.category,
        "date":
            DateTime.fromMillisecondsSinceEpoch(transaction.date).toString(),
        "description": transaction.description,
        "status": transaction.status,
        "value": transaction.value,
        "user_id": userId,
      }, path: mAddNewTransaction);

      final parsedData = TransactionModel.fromMap(
          response.data?["insert_transaction_one"] ?? {});

      if (parsedData.id != null) {
        return true;
      }
      throw Exception(response.exception);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateTransaction(TransactionModel transaction) async {
    try {
      final response = await graphqlService.update(params: {
        "id": transaction.id,
        "category": transaction.category,
        "date":
            DateTime.fromMillisecondsSinceEpoch(transaction.date).toString(),
        "description": transaction.description,
        "status": transaction.status,
        "value": transaction.value,
      }, path: mUpdateTransaction);

      final parsedData = TransactionModel.fromMap(
          response.data?["update_transaction_by_pk"] ?? {});

      if (parsedData.id != null) {
        return true;
      }
      throw Exception(response.exception);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TransactionModel>> getAllTransactions(
      {required int limit, required int offset}) async {
    try {
      final response = await graphqlService.read(
        path: qGetAllTransactions,
        params: {
          'limit': limit,
          'offset': offset,
        },
      );

      final parsedData = List.from(response.data?['transaction'] ?? []);
      final transaction =
          parsedData.map((e) => TransactionModel.fromMap(e)).toList();
      return transaction;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BalancesModel> getBalances() async {
    try {
      final response =
          await graphqlService.read(path: qGetBalance);

      final balances = BalancesModel.fromMap(response.data ?? {});

      return balances;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TransactionModel>> getLatestTransactions() async {
    try {
      final response = await graphqlService.read(path: qGetLatestTransactions);

      final parsedData = List.from(response.data?['transaction'] ?? []);

      final transactions =
          parsedData.map((e) => TransactionModel.fromMap(e)).toList();
      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
