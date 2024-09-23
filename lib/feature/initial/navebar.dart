import 'package:al_dahabiya/feature/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../offers/presentation/view/offers_screen.dart';

class CustomBottomNaveBar extends StatefulWidget {
  const CustomBottomNaveBar({super.key});

  @override
  State<CustomBottomNaveBar> createState() => _CustomBottomNaveBarState();
}

class _CustomBottomNaveBarState extends State<CustomBottomNaveBar> {
  int currentIndex = 0;

  final List<Widget> items = [
    const HomeScreen(),
    const OffersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        iconSize: 30.sp,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFEE6A60),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'العروض',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.grid_view_outlined,
          //   ),
          //   label: 'الاصناف',
          // ),
        ],
      ),
      body: items[currentIndex],
    );
  }
}
