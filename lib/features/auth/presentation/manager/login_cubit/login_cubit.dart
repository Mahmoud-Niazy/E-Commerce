import 'package:ecommerce/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

   login({
    required String email,
    required String password,
  }) async {
     emit(LoginLoadingState());
    var data = await authRepo.login(email: email, password: password,);
    data.fold(
      (error) => emit(LoginErrorState(error.errorMessage)),
      (token) {
        emit(LoginSuccessState(token));
      },
    );
  }
}
