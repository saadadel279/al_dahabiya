import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/offer_list_item.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:al_dahabiya/feature/offers/data/repo/offer_repo.dart';
import 'package:al_dahabiya/feature/offers/presentation/view_model/offers_cubit/offers_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OffersCubit(OfferRepo(apiServices: DioConsumer(dio: Dio())))
            ..getOffers(),
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
              pageTitle: ' كل العروض',
            ),
            SizedBox(
              height: 15.h,
            ),
            const SearshTap(),
            SizedBox(
              height: 15.h,
            ),
            BlocBuilder<OffersCubit, OffersState>(
              builder: (context, state) {
                if (state is OffersSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Directionality(
                          textDirection: TextDirection.rtl,
                          child: OfferListItem(
                            offer: state.offersModel!.data![index],
                          )),
                      itemCount: state.offersModel!.data!.length,
                    ),
                  );
                } else if (state is OffersFailure) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        )),
      )),
    );
  }
}
