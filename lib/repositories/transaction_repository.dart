import 'dart:developer';

import 'package:financy_app/commom/constants/queries/get_all_transactions.dart';
import 'package:financy_app/commom/models/transaction_model.dart';
import 'package:financy_app/locator.dart';
import 'package:financy_app/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class TransactionRepository {
  Future<void> addTransaction();
  Future<List<TransactionModel>> getAllTransaction();
}

class TransactionRepositoryImpl implements TransactionRepository{
      final client = locator.get<GraphQLService>().client;

  @override
  Future<void> addTransaction() {
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    try {
      final response = await client.query(QueryOptions(document: gql(qGetAllTransactions)));
      final parsedData = List.from(response.data?['transaction'] ?? []);
      final transaction = parsedData.map((e)=> TransactionModel.fromMap(e)).toList();
      return transaction;
    } catch (e) {
      rethrow;
    }
  }
  
}