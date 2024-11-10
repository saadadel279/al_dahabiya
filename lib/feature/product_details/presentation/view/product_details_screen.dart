import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:al_dahabiya/core/models/product_model.dart';
import 'package:al_dahabiya/core/widgets/snak_bar.dart';
import 'package:al_dahabiya/feature/cart/data/repo/cart_repo.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/product_details_section.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/product_titile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/sql_db.dart';
import '../../../cart/presentation/view_mode/cubit/cart_cubit.dart';
import '../view_model/cubit/counter_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    this.productOfBrand,
  });

  final Product? productOfBrand;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    bool favoriteStatus = await isFavorite(widget.productOfBrand!.id!);
    setState(() {
      isFav = favoriteStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(CartRepo(sqlDB: SqlDB())),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddOrDeleatToCartSuccess) {
            showSnackBar(context, 'تمت الاضافة الي السلة');
          } else if (state is CartFailure) {
            showSnackBar(context, 'هذا المنتج موجود بالفعل في السلة');
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFCB6C7F),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 2.2 / 3 * height,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 80.h),
                          ProductDetailsSection(
                            isCounter: false,
                            detailsTitle: 'الخامات',
                            details: widget.productOfBrand!.desc ??
                                'مصنوع من البلاستيك المقوى',
                          ),
                          SizedBox(height: 20.h),
                          ProductDetailsSection(
                            isCounter: false,
                            detailsTitle: 'وصف المنتج',
                            details: widget.productOfBrand!.desc ??
                                'دلو يستخدم لتذويب المعقمات بإستخدام وسائل التنظبف في الماء عند المسح العلامة التجارية : الهلال والنجمة',
                          ),
                          SizedBox(height: 20.h),
                          const ProductDetailsSection(
                            isCounter: true,
                            detailsTitle: 'الكمية',
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: Builder(builder: (context) {
                              return InkWell(
                                onTap: () {
                                  var productQuantity =
                                      CacheHelper().getData(key: 'counter');
                                  context.read<CartCubit>().insertCartItem(
                                      widget.productOfBrand!.id!,
                                      '''INSERT INTO cart (product_id, name, price, imageUrl, quantity) VALUES (${widget.productOfBrand!.id!}, '${widget.productOfBrand!.name!}', ${widget.productOfBrand!.price!}, '${widget.productOfBrand!.image!}', $productQuantity)''',
                                      productQuantity);
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFB13E55),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'إضافة الى السلة',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -100.h,
                    child: Column(
                      children: [
                        ProductTitelSection(
                          productOfBrand: widget.productOfBrand,
                        ),
                        // Favorite Icon Section
                        IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: () async {
                            if (isFav) {
                              await removeFavorite(widget.productOfBrand!.id!);
                              showSnackBar(context, 'Removed from favorites');
                            } else {
                              await addFavorite(widget.productOfBrand!);
                              showSnackBar(context, 'Added to favorites');
                            }
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addFavorite(Product product) async {
    SqlDB sqlDB = SqlDB();
    await sqlDB.insertData(
        '''INSERT INTO favorites (product_id, name, price, imageUrl) VALUES (${product.id!}, '${product.name!}', ${product.price!}, '${product.image!}')''');
  }

  Future<void> removeFavorite(int productId) async {
    SqlDB sqlDB = SqlDB();
    await sqlDB
        .deleteData('DELETE FROM favorites WHERE product_id = $productId');
  }

  Future<bool> isFavorite(int productId) async {
    SqlDB sqlDB = SqlDB();
    var result = await sqlDB
        .selectData('SELECT * FROM favorites WHERE product_id = $productId');
    return result.isNotEmpty;
  }
}
