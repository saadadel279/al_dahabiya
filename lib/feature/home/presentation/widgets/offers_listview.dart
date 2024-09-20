import 'package:al_dahabiya/feature/home/presentation/view_model/offers_cubit/offers_cubit.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/offer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.offersModel!.data!.length,
            itemBuilder: (context, index) {
              return OfferListItem(
                offer: state.offersModel!.data![index],
              );
            },
          );
        } else if (state is OffersFailure) {
          return Center(child: Text(state.errMessage!));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
