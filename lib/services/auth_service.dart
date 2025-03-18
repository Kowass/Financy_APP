import 'package:financy_app/commom/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({String? name, required String email, required String password});
  Future signIn();
}