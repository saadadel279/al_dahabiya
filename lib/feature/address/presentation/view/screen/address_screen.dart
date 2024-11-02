import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:al_dahabiya/core/services/locator.dart';
import 'package:al_dahabiya/core/widgets/custom_button.dart';
import 'package:al_dahabiya/feature/address/data/models/city_model.dart';
import 'package:al_dahabiya/feature/address/data/models/government_model.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_page_title.dart';
import '../../../data/models/zone_model.dart';
import '../../view_model/cubit/address_cubit.dart';
import '../widgets/drop_down_function.dart';
import '../widgets/semulated_drop_down.dart';
import '../widgets/simulated_titiled_drop_down.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<GovernmentData>? governmentData;
  List<CityData>? cityData;
  List<ZoneData>? zoneData;

  String selectedGovern = '';

  String? selectedCity = "";

  String? selectedZone = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is GovernmentSuccess) {
            governmentData = state.governmentData;
          } else if (state is CitysSuccess) {
            cityData = state.cityData;
          } else if (state is ZonesSuccess) {
            zoneData = state.zoneData;
          } else if (state is AddAddressSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.addressModel!.message)),
            );
          } else if (state is AddAddressLoading) {
            isLoading = true;
          } else if (state is GovernmentLoading) {
            isLoading = true;
          } else if (state is CitysLoading) {
            isLoading = true;
          } else if (state is ZonesLoading) {
            isLoading = true;
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  PageTitleBar(
                    isTitlePade: true,
                    pageTitle: 'العناوين',
                  ),
                  SizedBox(height: 15.h),

                  // Button to trigger the dropdown modal
                  InkWell(
                    onTap: () {
                      dropDown(
                              title: 'اختر عنوانك الحالي من هنا',
                              data: [
                                SelectedListItem(
                                    name: 'شبين الكوم', value: 1.toString()),
                                SelectedListItem(
                                    name: 'القاهرة', value: 2.toString()),
                                SelectedListItem(
                                    name: 'الاسكندرية', value: 3.toString()),
                              ],
                              onSelected: (SelectedListItem) {})
                          .showModal(context);
                    },
                    child: const SemulatedDropDown(
                      title: 'اختر عنوانك الحالي من هنا...',
                    ),
                  ),

                  // Placeholder for address items list
                  SizedBox(height: 15.h),
                  Text('اضف عنوان جديد',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 85, 85, 85),
                      )),
                  SizedBox(height: 15.h),
                  BlocListener<AddressCubit, AddressState>(
                    listener: (context, state) {},
                    child: InkWell(
                      onTap: () {
                        context.read<AddressCubit>().getGovernments();
                        dropDown(
                            title: 'اختر المحافظة',
                            data: [
                              SelectedListItem(
                                  name: governmentData![0].name,
                                  value: governmentData![0].id.toString()),
                            ],
                            onSelected: (SelectedListItem) {
                              getIt<CacheHelper>().saveData(
                                  key: 'governmentid',
                                  value: SelectedListItem.value);
                              setState(() {
                                selectedGovern = SelectedListItem.name;
                              });
                            }).showModal(context);
                      },
                      child: SimulatedTiteldDropDown(
                        hint: 'اختر المحافظة...',
                        title: selectedGovern,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  InkWell(
                    onTap: () {
                      context.read<AddressCubit>().getCitys(
                          governId: int.parse(getIt<CacheHelper>()
                              .getData(key: 'governmentid')));

                      dropDown(
                          title: 'اختر المدينة',
                          data: [
                            SelectedListItem(
                                name: cityData![0].name,
                                value: cityData![0].id.toString()),
                          ],
                          onSelected: (SelectedListItem) {
                            getIt<CacheHelper>().saveData(
                                key: 'cityid', value: SelectedListItem.value);
                            setState(() {
                              selectedCity = SelectedListItem.name;
                            });
                          }).showModal(context);
                    },
                    child: SimulatedTiteldDropDown(
                      hint: 'اختر المدينة...',
                      title: selectedCity!,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  InkWell(
                    onTap: () {
                      context.read<AddressCubit>().getZones(
                          cityId: int.parse(
                              getIt<CacheHelper>().getData(key: 'cityid')));
                      dropDown(
                          title: 'اختر المنطقة',
                          data: [
                            SelectedListItem(
                              name: zoneData![0].name,
                              value: zoneData![0].id.toString(),
                            ),
                          ],
                          onSelected: (SelectedListItem selectedList) {
                            getIt<CacheHelper>().saveData(
                                key: 'zoneid', value: selectedList.value);
                            setState(() {
                              selectedZone = selectedList.name;
                            });
                          }).showModal(context);
                    },
                    child: SimulatedTiteldDropDown(
                      hint: 'اختر المنطقة...',
                      title: selectedZone!,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomButton(
                      onTap: () {
                        context.read<AddressCubit>().addAddress(
                            int.parse(getIt<CacheHelper>()
                                .getData(key: 'governmentid')),
                            int.parse(
                                getIt<CacheHelper>().getData(key: 'cityid')),
                            int.parse(
                                getIt<CacheHelper>().getData(key: 'zoneid')),
                            'address');
                      },
                      title: 'اضافة عنوان جديد',
                      isloading: false)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
