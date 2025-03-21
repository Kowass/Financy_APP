import 'package:financy_app/commom/models/user_model.dart';
import 'package:financy_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode.toString(),
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao logar. Tente novamente.';
      }
      throw 'Náo foi possível realizar login nesse momento. Tente novamente mais tarde.';
    }
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
        id: email.hashCode.toString(),
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
  
  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
