import 'package:al_dahabiya/feature/home/presentation/view_model/slider_cubit/slider_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
      ),
      child: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, state) {
          if (state is SliderSuccess) {
            return Center(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.sliderModel!.data.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CachedNetworkImage(
                      imageUrl:
                          'https://walker-stores.com/images/${state.sliderModel!.data[index].image}',
                      height: 100.h,
                      width: 350.w,
                      fit: BoxFit.fill),
                ),
              ),
            );
          } else if (state is SliderFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
