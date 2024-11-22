import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/models/product_model.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/core/widgets/snak_bar.dart';
import 'package:al_dahabiya/feature/search/data/repo/search_repo.dart';
import 'package:al_dahabiya/feature/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animation_search_bar/animation_search_bar.dart'
    show AnimationSearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../filter/presentation/view/widgets/product)in_filter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(SearchRepo(apiServices: DioConsumer(dio: Dio()))),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD04430),
                boxShadow: [

                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(0, 5),

                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Builder(
                builder: (context) {
                  return AnimationSearchBar(
                    searchFieldDecoration: BoxDecoration(color: Colors.white),
                    closeIconColor: Colors.white,
                    backIconColor: Colors.white,
                    centerTitle: ' اكتب هنا اللي بتدور علية',
                    centerTitleStyle:
                        TextStyle(color: Colors.white, fontSize: 18.sp),
                    searchIconColor: Colors.white,
                    onChanged: (text) {
                      context.read<SearchCubit>().search(text);
                    },
                    horizontalPadding: 5,
                    searchTextEditingController:
                        _searchController, // Attach controller
                  );
                }
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state is SearchLoading) {
                setState(() {
                  isLoading = true;
                });
              } else if (state is SearchSuccess) {
                products = state.searchModel!.data;
              } else if (state is SearchFailuer) {
                showSnackBar(context, state.errMessage);
              }
            },
            child:  ModalProgressHUD(
              inAsyncCall: isLoading,
              child: GridView.builder(
                  itemBuilder: (context, index) {
                    final product = products![index];

                    return ProductInFilter(product: product);
                  },
                  itemCount: products?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 250,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
            ),
            ),
          ),
        ),
    );
  }
}
