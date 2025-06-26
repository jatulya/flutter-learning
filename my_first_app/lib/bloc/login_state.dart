class LoginState {
  final String email;
  final String password;

  const LoginState({this.email = '', this.password = ''});

  bool get enabled => email.length >= 6 && password.length >= 6;

  LoginState copyWith({String? email, String? password}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}