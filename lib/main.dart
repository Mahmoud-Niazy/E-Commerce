import 'package:ecommerce/core/api_services/api_services.dart';
import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:ecommerce/core/service_locator/service_locator.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/favourites/data/repos/favourites_repo.dart';
import 'package:ecommerce/features/favourites/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:ecommerce/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ecommerce/features/splash/presentation/view/splash_view.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/app_keys/app_keys.dart';
import 'features/cart/data/repos/cart_repo.dart';
import 'features/home/data/repos/home_repo.dart';
import 'features/layout/presentation/manager/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'features/profile/data/repos/profile_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = AppKeys.stripePublishableKey;
  runApp(const MyApp());
  ApiServices.init();
  ServicesLocator.init();
  await CacheHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBarCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            serviceLocator<HomeRepo>(),
          )
            ..getBanners()
            ..getCategories()
            ..getAllProducts(),
        ),
        BlocProvider(
          create: (context) => FavouritesCubit(
            serviceLocator<FavouritesRepo>(),
          )..getFavourites(),
        ),
        BlocProvider(
          create: (context) =>
              CartCubit(serviceLocator<CartRepo>())..getCartProducts(),
        ),
        BlocProvider(
          create: (context) =>
              ProfileCubit(serviceLocator<ProfileRepo>())..getUserData(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
