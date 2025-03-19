abstract class SignUpState {
}

class SignUpStateIntial extends SignUpState {}
class SignUpStateLoading extends SignUpState {}
class SignUpStateSuccess extends SignUpState {}
class SignUpStateError extends SignUpState {
  final String message;

  SignUpStateError(this.message);
}