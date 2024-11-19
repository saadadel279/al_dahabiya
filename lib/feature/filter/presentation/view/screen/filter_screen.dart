import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:drop_down_list/model/selected_list_item.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/models/product_model.dart';
import '../../../../categories/data/model/categoty_Response_model.dart';
import '../../../../home/data/models/brands_model.dart';
import '../../../data/repo/filter_product.dart';
import '../../view_model/cubit/filter_product_cubit.dart';
import '../widgets/filter_tab_item.dart';
import '../widgets/product)in_filter.dart';
import '../../../../address/presentation/view/widgets/drop_down_function.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

// Global Variables
int cat = 0;
final List<List> price = [
  [50, 10000],
  [1, 1000],
  [1001, 3500],
  [3501, 5000],
  [5001, 7500],
  [7501, 9500],
  [9501, 1000000],
];
bool isLoading = true;
List<CategoryResponseModel>? categories;
List<BrandsModel>? brandsModel;
List<Product>? products;
Product? productDetails;

// Selected Filters
List<int> selectedPrice = [50, 10000];
int selectedBrand = 46;
int selectedCategories = 78;
String selectedCategoriesName = 'الكل';
String selectedBrandName = 'الكل';
String selectedPriceName = 'الكل';

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterProductCubit(
        FilterProductRepo(apiServices: DioConsumer(dio: Dio())),
      )
        ..getBrands()
        ..getCategories()
        ..getFilterProduct(selectedCategories, [selectedBrand], selectedPrice),
      child: BlocListener<FilterProductCubit, FilterProductState>(
        listener: (context, state) {
          setState(() {
            isLoading = state is CategoriesLoading ||
                state is BrandsLoading ||
                state is FilterProductLoading;
          });
          if (state is CategoriesSuccess) {
            categories = state.categoryResponseModel;
            log('Categories Loaded: $categories');
          } else if (state is BrandsSuccess) {
            brandsModel = state.brandssModel;
            log('Brands Loaded: $brandsModel');
          } else if (state is FilterProductSuccess) {
            products = state.filteredPoductModel.data;
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // Header
                  Container(
                    height: 70.h,
                    color: const Color(0xFFCB6D7F),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(
                              builder: (context) {
                                return IconButton(
                                  onPressed: () {
                                    context.read<FilterProductCubit>().getFilterProduct(
                                      selectedCategories,
                                      [selectedBrand],
                                      selectedPrice,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                );
                              }
                            ),
                            Text(
                              'المنتجات',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Body
                  Expanded(
                    child: Column(
                      children: [
                        // Filters Row
                        Material(
                          elevation: 5,
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Categories Filter
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      final List<SelectedListItem> categoryItems =
                                      categories!
                                          .expand((categoryResponse) =>
                                      categoryResponse.data)
                                          .map((category) {
                                        return SelectedListItem(
                                          address: '',
                                          shapingCost: '',
                                          name: category.name!,
                                          value: category.id.toString(),
                                        );
                                      }).toList();

                                      dropDown(
                                        title: 'الاصناف',
                                        data: categoryItems,
                                        onSelected: (SelectedListItem item) {
                                          setState(() {
                                            selectedCategoriesName = item.name;
                                            selectedCategories =
                                                int.parse(item.value);
                                          });
                                        },
                                      ).showModal(context);
                                    },
                                    child: FilterTabItem(
                                      title: 'الاصناف',
                                      subtitle: selectedCategoriesName,
                                    ),
                                  ),
                                ),

                                // Brands Filter
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      final List<SelectedListItem> brandItems =
                                      brandsModel!
                                          .expand((brandsResponse) =>
                                      brandsResponse.data)
                                          .map((brand) {
                                        return SelectedListItem(
                                          address: '',
                                          shapingCost: '',
                                          name: brand.name,
                                          value: brand.id.toString(),
                                        );
                                      }).toList();

                                      dropDown(
                                        title: 'الماركات',
                                        data: brandItems,
                                        onSelected: (SelectedListItem item) {
                                          setState(() {
                                            selectedBrandName = item.name;
                                            selectedBrand =
                                                int.parse(item.value);
                                          });
                                        },
                                      ).showModal(context);
                                    },
                                    child: FilterTabItem(
                                      title: 'الماركات',
                                      subtitle: selectedBrandName,
                                    ),
                                  ),
                                ),

                                // Price Filter
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      final List<SelectedListItem> priceItems =
                                      price.map((range) {
                                        return SelectedListItem(
                                          address: '',
                                          shapingCost: '',
                                          name: '${range[0]} - ${range[1]}',
                                          value: '${range[0]}-${range[1]}',
                                        );
                                      }).toList();

                                      dropDown(
                                        title: 'السعر',
                                        data: priceItems,
                                        onSelected: (SelectedListItem item) {
                                          setState(() {
                                            selectedPriceName = item.name;
                                            selectedPrice = item.value
                                                .split('-')
                                                .map(int.parse)
                                                .toList();
                                          });
                                        },
                                      ).showModal(context);
                                    },
                                    child: FilterTabItem(
                                      title: 'السعر',
                                      subtitle: selectedPriceName,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Products Grid
                        SizedBox(height: 20.h),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GridView.builder(
                              itemBuilder: (context, index) {
                                final product = products![index];
                                return ProductInFilter(product: product);
                              },
                              itemCount: products?.length ?? 0,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 250,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
