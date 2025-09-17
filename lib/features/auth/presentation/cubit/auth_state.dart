class Auth_State {}

class AuthInitialState extends Auth_State {}

class AuthLoadingState extends Auth_State {}

class AuthSuccessState extends Auth_State {}

class AuthErrorState extends Auth_State {
  final String error;
  AuthErrorState(this.error);
}
