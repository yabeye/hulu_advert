import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int page;
  final void Function(int) onPageChange;

  const AppBottomNavBar({
    super.key,
    required this.page,
    required this.onPageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.gray,
            width: 0.3,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: page,
        onTap: (pg) {
          onPageChange(pg);
        },
        backgroundColor: AppColors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_list_outlined,
              size: 26,
            ),
            activeIcon: Icon(
              Icons.view_list,
              size: 32,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              size: 26,
            ),
            activeIcon: Icon(
              Icons.search,
              size: 32,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.align_vertical_bottom_outlined,
              size: 26,
            ),
            activeIcon: Icon(
              Icons.align_vertical_bottom,
              size: 32,
            ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
