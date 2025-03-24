import 'package:financy_app/commom/models/user_model.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage secureStorage;
  late MockFirebaseAuthService firebaseAuthService;
  late UserModel user;
  setUp(() {
    secureStorage = MockSecureStorage();
    firebaseAuthService = MockFirebaseAuthService();
    signUpController = SignUpController(firebaseAuthService, secureStorage);
    user = UserModel(
      name: "User",
      email: "user@email.com",
      id: "1a2b3c4d5e",
    );
  });

  test('Test sign up controller', () async {
    expect(signUpController.state, isInstanceOf<SignUpStateIntial>());
    await signUpController.signUp(
      name: "User",
      email: "user@email.com",
      password: "user@123",
    );    
    expect(signUpController.state, isInstanceOf<SignUpStateSuccess>());
  });
}
