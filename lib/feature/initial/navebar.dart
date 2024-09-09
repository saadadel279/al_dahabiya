import 'package:al_dahabiya/feature/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNaveBar extends StatefulWidget {
  const CustomBottomNaveBar({super.key});

  @override
  State<CustomBottomNaveBar> createState() => _CustomBottomNaveBarState();
}

class _CustomBottomNaveBarState extends State<CustomBottomNaveBar> {
  final List<Widget> items = [const HomeScreen(), const Text('Profile')];
  int currentIndex = 0;
  final PageController _pageController =
      PageController(); // Add a page controller for animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.orangeAccent, // Set the background color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      // Using PageView for animated transitions between pages
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
