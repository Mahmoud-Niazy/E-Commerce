abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  final String token;
  RegisterSuccessState(this.token);
}
class RegisterErrorState extends RegisterStates{
  final String error ;
  RegisterErrorState(this.error);
}