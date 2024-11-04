import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:al_dahabiya/core/services/locator.dart';
import 'package:al_dahabiya/core/widgets/custom_button.dart';
import 'package:al_dahabiya/feature/address/data/models/city_model.dart';
import 'package:al_dahabiya/feature/address/data/models/government_model.dart';
import 'package:al_dahabiya/feature/address/data/models/user_address_model.dart';
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
  List<AddressData>? addressData;

  String selectedGovern = '';
  String curentAddress = '';
  late String curentAddressId;

  late String curentAddressShapingCost;
  late int selectedGovernid;
  late int selectedCityid;
  late int selectedZoneid;

  String? selectedCity = "";
  String? selectedZone = '';
  bool isLoading = true;

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          setState(() {
            isLoading = state is GovernmentLoading ||
                state is GetUserAddressLoading ||
                state is CitysLoading ||
                state is ZonesLoading ||
                state is AddAddressLoading;
          });

          if (state is GovernmentSuccess) {
            governmentData = state.governmentData;
          } else if (state is GetUserAddressSuccess) {
            addressData = state.addressData;
          } else if (state is CitysSuccess) {
            cityData = state.cityData;
          } else if (state is ZonesSuccess) {
            zoneData = state.zoneData;
          } else if (state is AddAddressSuccess) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.addressModel!.message)),
            );

            setState(() {
              selectedGovern = '';
              selectedCity = '';
              selectedZone = '';
              addressController.clear();
            });

            context.read<AddressCubit>().getUserAddress();
          }
        },
        child: Stack(
          children: [
            SingleChildScrollView(
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
                      InkWell(
                        onTap: () {
                          final List<SelectedListItem> addressItems =
                              addressData!
                                  .map((add) => SelectedListItem(
                                        address: '',
                                        shapingCost: '',
                                        name: add.address,
                                        value: add.id.toString(),
                                      ))
                                  .toList();
                          dropDown(
                              title: 'اختر عنوانك الحالي من هنا',
                              data: addressItems,
                              onSelected: (SelectedListItem) {
                                setState(() {
                                  curentAddress = SelectedListItem.name;
                                  curentAddressId = SelectedListItem.value;

                                  getIt<CacheHelper>().saveData(
                                      key: 'curentAddress',
                                      value: curentAddress);
                                  getIt<CacheHelper>().saveData(
                                      key: 'curentAddressId',
                                      value: curentAddressId);
                                });
                              }).showModal(context);
                        },
                        child: const SemulatedDropDown(
                          title: 'اختر عنوانك الحالي من هنا...',
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text('اضف عنوان جديد',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 85, 85, 85),
                          )),
                      SizedBox(height: 15.h),
                      InkWell(
                        onTap: () {
                          final List<SelectedListItem> governmentItems =
                              governmentData!
                                  .map((gov) => SelectedListItem(
                                        address: '',
                                        shapingCost: '',
                                        name: gov.name,
                                        value: gov.id.toString(),
                                      ))
                                  .toList();

                          dropDown(
                            title: 'اختر المحافظة',
                            data: governmentItems,
                            onSelected: (SelectedListItem selectedListItem) {
                              setState(() {
                                selectedGovern = selectedListItem.name;
                                selectedGovernid =
                                    int.parse(selectedListItem.value);
                              });
                              context
                                  .read<AddressCubit>()
                                  .getCitys(governId: selectedGovernid);
                            },
                          ).showModal(context);
                        },
                        child: SimulatedTiteldDropDown(
                          hint: 'اختر المحافظة...',
                          title: selectedGovern,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      InkWell(
                        onTap: () {
                          final List<SelectedListItem> cityItems = cityData!
                              .map((city) => SelectedListItem(
                                    address: '',
                                    shapingCost: '',
                                    name: city.name,
                                    value: city.id.toString(),
                                  ))
                              .toList();

                          dropDown(
                              title: 'اختر المدينة',
                              data: cityItems,
                              onSelected: (SelectedListItem) {
                                setState(() {
                                  selectedCity = SelectedListItem.name;
                                  selectedCityid =
                                      int.parse(SelectedListItem.value);
                                });
                                context
                                    .read<AddressCubit>()
                                    .getZones(cityId: selectedCityid);
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
                          List<SelectedListItem> zoneItems = zoneData!
                              .map((zone) => SelectedListItem(
                                    address: '',
                                    shapingCost: '',
                                    name: zone.name,
                                    value: zone.id.toString(),
                                  ))
                              .toList();
                          dropDown(
                              title: 'اختر المنطقة',
                              data: zoneItems,
                              onSelected: (SelectedListItem selectedList) {
                                getIt<CacheHelper>().saveData(
                                    key: 'zoneid', value: selectedList.value);
                                setState(() {
                                  selectedZone = selectedList.name;
                                  selectedZoneid =
                                      int.parse(selectedList.value);
                                });
                              }).showModal(context);
                        },
                        child: SimulatedTiteldDropDown(
                          hint: 'اختر المنطقة...',
                          title: selectedZone!,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            hintText: ' عنوانك',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomButton(
                          onTap: () {
                            context.read<AddressCubit>().addAddress(
                                selectedGovernid,
                                selectedCityid,
                                selectedZoneid,
                                addressController.text);
                          },
                          title: 'اضافة عنوان جديد',
                          isloading: false),
                    ],
                  ),
                ),
              ),
            ),
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
