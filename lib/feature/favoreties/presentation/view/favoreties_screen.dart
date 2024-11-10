import 'package:al_dahabiya/core/database/sql_db.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/favoreties/data/repo/favorits_repo.dart';
import 'package:al_dahabiya/feature/favoreties/presentation/view/widgets/favorit_produc_item.dart';
import 'package:al_dahabiya/feature/favoreties/presentation/view_model/cubit/favorits_cubit.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/search_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritsScreen extends StatelessWidget {
  const FavoritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoritsCubit(FavoritsRepo(sqlDB: SqlDB()))..getFavorits(),
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            PageTitleBar(
              isTitlePade: true,
              pageTitle: 'المفضلة ',
            ),
            SizedBox(
              height: 15.h,
            ),
            const SearshTap(),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: BlocBuilder<FavoritsCubit, FavoritsState>(
                builder: (context, state) {
                  if (state is FavoritsSuccess) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        itemBuilder: (context, index) => Directionality(
                            textDirection: TextDirection.rtl,
                            child: SizedBox(
                              height: 250.h,
                              child: FavoritProductItem(
                                product: state.products[index],
                              ),
                            )),
                        itemCount: state.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                      ),
                    );
                  } else if (state is FavoritsFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        )),
      )),
    );
  }
}
