import 'package:financy_app/commom/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock_classes.dart';

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      name: "User",
      email: "user@email.com",
      id: "1a2b3c4d5e",
    );
  });

  group('test sign up', () {
    test('Test sign up success', () async {
      when(
        () => mockFirebaseAuthService.signUp(
          name: "User",
          email: "user@email.com",
          password: "user@123",
        ),
      ).thenAnswer((_) async => user);

      final result = await mockFirebaseAuthService.signUp(
        name: "User",
        email: "user@email.com",
        password: "user@123",
      );

      expect(result, user);
    });
    test('Test sign up fail', () async {
      when(
        () => mockFirebaseAuthService.signUp(
          name: "User",
          email: "user@email.com",
          password: "user@123",
        ),
      ).thenThrow(
        Exception(),
      );

      expect(
          () => mockFirebaseAuthService.signUp(
                name: "User",
                email: "user@email.com",
                password: "user@123",
              ),
          // throwsA(isInstanceOf<Exception>()),
          throwsException);
    });
  });
}
