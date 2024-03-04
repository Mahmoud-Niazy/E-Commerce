import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:ecommerce/features/profile/presentation/manager/profile_cubit/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repos/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  UserModel? user;

  getUserData() async {
    emit(GetUserDataLoadingState());
    var data = await profileRepo.getUserData();
    data.fold(
      (failure) {
        emit(GetUserDataErrorState(failure.errorMessage));
      },
      (userData) {
        user = userData;
        emit(GetUserDataSuccessfullyState(userData));
      },
    );
  }

  updateUserData({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String image,
  }) async {
    emit(UpdateUserDataLoadingState());
    var data = await profileRepo.updateUserData(
      name: name,
      email: email,
      phone: phone,
      password: password,
      image: image,
    );

    data.fold(
      (failure) => emit(
        UpdateUserDataErrorState(
          failure.errorMessage,
        ),
      ),
      (userData) => emit(
        UpdateUserDataSuccessfullyState(
          userData,
        ),
      ),
    );
  }


}
