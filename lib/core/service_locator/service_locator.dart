import 'package:ecommerce/features/cart/data/repos/cart_repo.dart';
import 'package:ecommerce/features/favourites/data/repos/favourites_repo.dart';
import 'package:ecommerce/features/search/data/repos/search_repo_imp.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/cart/data/repos/cart_repo_imp.dart';
import '../../features/favourites/data/repos/favourites_repo_imp.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/profile/data/repos/profile_repo.dart';
import '../../features/profile/data/repos/profile_repo_imp.dart';
import '../../features/search/data/repos/search_repo.dart';
import '../api_services/api_services.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator {
  static void init() {
    /// Api Services
    serviceLocator.registerLazySingleton<ApiServices>(
      () => ApiServices(),
    );

    /// Repos
    serviceLocator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<HomeRepo>(
      () => HomeRepoImp(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<SearchRepo>(
      () => SearchRepoImp(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<FavouritesRepo>(
      () => FavouritesRepoImp(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<CartRepo>(
      () => CartRepoImp(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<ProfileRepo>(
      () => ProfileRepoImp(serviceLocator()),
    );
  }
}
