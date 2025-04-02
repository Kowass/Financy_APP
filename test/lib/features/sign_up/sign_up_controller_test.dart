import 'package:financy_app/commom/models/user_model.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late MockGraphQLService mockGraphQLService;
  late UserModel user;
  setUp(() {
    mockSecureStorage = MockSecureStorage();
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockGraphQLService = MockGraphQLService();

    signUpController =
        SignUpController(authService: mockFirebaseAuthService, graphQLService: mockGraphQLService, secureStorage: mockSecureStorage);
        
    user = UserModel(
      name: "User",
      email: "user@email.com",
      id: "1a2b3c4d5e",
    );
  });

  test('Test sign up controller Success State', () async {
    expect(signUpController.state, isInstanceOf<SignUpStateIntial>());

    when(() => mockGraphQLService.init()).thenAnswer((_) async {});

    when(() => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        )).thenAnswer((_) async {});

    when(() => mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@email.com',
          password: 'user@123',
        )).thenAnswer((_) async => user,);

    await signUpController.signUp(
      name: "User",
      email: "user@email.com",
      password: "user@123",
    );
    expect(signUpController.state, isInstanceOf<SignUpStateSuccess>());
  });

  test('Test sign up controller Error State', () async {
    expect(signUpController.state, isInstanceOf<SignUpStateIntial>());

    when(() => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        )).thenAnswer((_) async {});

    when(() => mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@email.com',
          password: 'user@123',
        )).thenThrow(Exception());

    await signUpController.signUp(
      name: "User",
      email: "user@email.com",
      password: "user@123",
    );
    expect(signUpController.state, isInstanceOf<SignUpStateError>());
  });
}
