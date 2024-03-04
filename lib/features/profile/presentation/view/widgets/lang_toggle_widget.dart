import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/core/cache_helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/lang_cubit/lang_cubit.dart';
import '../../manager/lang_cubit/lang_states.dart';


class LangToggleWidget extends StatelessWidget {
  const LangToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCubit, LangStates>(
      builder: (context, state) {
        return Switch(
          activeColor: AppConstance.primaryColor,
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.white,
          trackOutlineColor: MaterialStateProperty.resolveWith(
                (final Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return null;
              }

              return AppConstance.primaryColor;
            },
          ),
          value: CacheHelper.getData(key: 'langAr') ?? false,
          onChanged: (value) {
            LangCubit.get(context).toggleBetweenLanguages();
          },
        );
      },
    );
  }
}