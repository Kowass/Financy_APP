import 'package:financy_app/services/auth_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final AuthService authService;

  GraphQLService({required this.authService,});
  
  late GraphQLClient client;

  Future<void> init() async {
    final token = await authService.userToken;

    final HttpLink httpLink = HttpLink(
    'https://giving-cougar-45.hasura.app/v1/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  final Link link = authLink.concat(httpLink);

  client = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}