import 'package:financy_app/commom/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  });
  Future<UserModel> signIn({
    required String email,
    required String password,
  });
  Future<void> signOut();

  Future<String?> get userToken;
}
