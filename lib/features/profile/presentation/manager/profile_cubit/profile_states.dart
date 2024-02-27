import '../../../data/models/user_model.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates{}

class GetUserDataLoadingState extends ProfileStates{}
class GetUserDataSuccessfullyState extends ProfileStates{
  final UserModel userData ;
  GetUserDataSuccessfullyState(this.userData);
}
class GetUserDataErrorState extends ProfileStates{
  final String error;
  GetUserDataErrorState(this.error);
}