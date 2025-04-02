import 'package:financy_app/features/home/home_controller.dart';
import 'package:financy_app/features/sign_in/sign_in_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/splash/splash_controller.dart';
import 'package:financy_app/repositories/transaction_repository.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:financy_app/services/firebase_auth_service.dart';
import 'package:financy_app/services/graphql_service.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerFactory<AuthService>(
    () => FirebaseAuthService(),
  );

  locator.registerLazySingleton<GraphQLService>(
    () => GraphQLService(
      authService: locator.get<AuthService>(),
    ),
  );

  locator.registerFactory<SplashController>(
    () => SplashController(
        secureStorage: const SecureStorage(),
        graphQLService: locator.get<GraphQLService>()),
  );
  locator.registerFactory<SignInController>(
    () => SignInController(
      authService: locator.get<AuthService>(),
      graphQLService: locator.get<GraphQLService>(),
      secureStorage: const SecureStorage(),
    ),
  );

  locator.registerFactory<SignUpController>(
    () => SignUpController(
      authService: locator.get<AuthService>(),
      secureStorage: SecureStorage(),
      graphQLService: locator.get<GraphQLService>(),
    ),
  );

  locator.registerFactory<TransactionRepository>(
    () => TransactionRepositoryImpl(),
  );

  locator.registerLazySingleton<HomeController>(
    () => HomeController(
      locator.get<TransactionRepository>(),
    ),
  );
}
