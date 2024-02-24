import 'package:ecommerce/core/app_constance/app_constance.dart';
import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit/home_cubit.dart';
import '../../manager/home_cubit/home_states.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel? categoryModel;
  final bool isForAll;
  final bool isSelected ;


   const CategoryItem({
    super.key,
    this.categoryModel,
    this.isForAll = false,
     this.isSelected = false ,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Container(
          height: 45,
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: isForAll ? 15 : 10,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppConstance.primaryColor : Colors.white,
            border: !isSelected ? Border.all(
              color: Colors.black,
            )  : null ,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isForAll)
                Image.network(
                  categoryModel!.image,
                  width: 40,
                ),
              Text(
                isForAll ? S.of(context).All : categoryModel!.name,
                style: AppStyles.style18.copyWith(
                  color: isSelected ? Colors.white: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
