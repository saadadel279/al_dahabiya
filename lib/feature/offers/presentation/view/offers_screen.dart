import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/offer_list_item.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const Directionality(
                  textDirection: TextDirection.rtl, child: OfferListItem()),
              itemCount: 5,
            ),
          )
        ],
      )),
    ));
  }
}
