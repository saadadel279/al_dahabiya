import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/most_visited_item.dart';
import 'package:al_dahabiya/feature/home/presentation/view_model/most_visited_cubit/most_visited_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MostVisitedListview extends StatelessWidget {
  const MostVisitedListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: BlocBuilder<MostVisitedCubit, MostVisitedState>(
        builder: (context, state) {
          if (state is MostVisitedSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.mostVisitedModel!.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouters.kProductScreenRoute);
                    },
                    child: MostVisitedItem(
                      product: state.mostVisitedModel!.data[index],
                    ));
              },
            );
          } else if (state is MostVisitedFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
