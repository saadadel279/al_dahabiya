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
  final List<Widget> items = [
    const HomeScreen(),
    const OffersScreen(),
  ];
  int currentIndex = 0;
  final PageController _pageController = PageController();
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
          // Animate to the selected page
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
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
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: items,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
