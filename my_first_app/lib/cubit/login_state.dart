class LoginState {
  String email;
  String password;

  LoginState({
    required this.email, 
    required this.password});

  bool get enabled => email.length >= 6  && password.length >= 6 ;

   LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

}