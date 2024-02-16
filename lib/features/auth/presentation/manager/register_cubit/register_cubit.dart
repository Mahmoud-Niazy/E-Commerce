import 'package:ecommerce/features/auth/data/models/user_registration_input_model.dart';
import 'package:ecommerce/features/auth/presentation/manager/register_cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final AuthRepo authRepo;

  RegisterCubit(this.authRepo) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  register({
    required UserRegistrationInputModel userData,
  }) async {
    emit(RegisterLoadingState());
    var data = await authRepo.register(userData: userData);
    data.fold(
      (error) => emit(RegisterErrorState(error.errorMessage)),
      (token) => emit(RegisterSuccessState(token)),
    );
  }
}
