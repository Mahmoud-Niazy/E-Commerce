import 'package:ecommerce/core/service_locator/service_locator.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/core/widgets/shake_transition.dart';
import 'package:ecommerce/features/search/data/repos/search_repo.dart';
import 'package:ecommerce/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce/features/search/presentation/view/widgets/list_of_searched_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/search_cubit/search_states.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(serviceLocator<SearchRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * .02,
                  ),
                  BlocBuilder<SearchCubit, SearchStates>(
                    buildWhen:(previous,current)=> (current is SearchSuccessState ||
                        current is SearchLoadingState ),
                    builder: (context, state) {
                      return ShakeTransition(
                        duration: const Duration(
                          seconds: 3,
                        ),
                        offset: -60,
                        axis: Axis.vertical,
                        child: SearchWidget(
                          onTap: () {},
                          controller: searchController,
                          readOnly: false,
                          onSubmitted: (String value) {
                            SearchCubit.get(context).search(
                              text: searchController.text,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: screenSize.height * .02,
                  ),
                 const ListOfSearchedProducts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
