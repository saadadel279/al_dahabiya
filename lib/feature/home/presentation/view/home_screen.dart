import 'package:al_dahabiya/feature/home/presentation/widgets/location_badge.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
                child: const Row(
                  children: [
                    LocationBadge(),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const SearshTap(),
              SizedBox(height: 10.h),
              Image.asset(
                'assets/images/offer.png',
                height: 100,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
