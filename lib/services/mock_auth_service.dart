import 'package:financy_app/commom/models/user_model.dart';
import 'package:financy_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        name: name,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura. Tente uma senha forte.';
      }
      throw 'Náo foi possível criar sua conta nesse momento.';
    }
  }
}
