import 'dart:developer';

import 'package:financy_app/services/api_service.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService implements ApiService<GraphQLClient, QueryResult> {
  final AuthService authService;

  GraphQLService({
    required this.authService,
  });

  late GraphQLClient _client;
  GraphQLClient get client => _client;

  Future<void> init() async {
    final token = await authService.userToken;
    log("Token de usuário: $token");

    final HttpLink httpLink = HttpLink(
      'https://giving-cougar-45.hasura.app/v1/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );

    final Link link = authLink.concat(httpLink);

    _client = GraphQLClient(
      link: link,
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.networkOnly),
        mutate: Policies(fetch: FetchPolicy.networkOnly),
      ),
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  @override
  Future<QueryResult> create({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await client.mutate(
        MutationOptions(
          variables: params ?? {},
          document: gql(path),
        ),
      );
    } on ServerException {
      throw Exception('No connection at this time. Try again later');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<QueryResult> delete({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<QueryResult> read({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await client.query(
        QueryOptions(
          variables: params ?? {},
          document: gql(path),
        ),
      );
    } on ServerException {
      throw Exception('No connection at this time. Try again later');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<QueryResult> update({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await client.mutate(
        MutationOptions(
          variables: params ?? {},
          document: gql(path),
          onError: (error) => throw error as Object,
        ),
      );
      return response;
    } on OperationException {
      throw Exception('No connection at this time. Try again later');
    } catch (e) {
      rethrow;
    }
  }
}
