import 'package:flutter/material.dart';

// Callback function type definition
typedef OnNavItemTap = void Function(int index);

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final OnNavItemTap onItemTap;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFF1A915A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: BottomNavigationBar(
        items: [
          _buildBottomNavItem(Icons.home_outlined, 0),
          _buildBottomNavItem(Icons.notifications_outlined, 1),
          _buildBottomNavItem(Icons.message_outlined, 2),
          _buildBottomNavItem(Icons.person_outlined, 3),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTap,
        backgroundColor: Colors.transparent, // Make the background transparent
        elevation: 0, // Remove the shadow
        type: BottomNavigationBarType.fixed, // Ensure labels are always shown
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(IconData iconData, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: selectedIndex == index
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            iconData,
            color: selectedIndex == index ? const Color(0xFF1A915A) : Colors.white, // Icon color changes based on selection
          ),
        ),
      ),
      label: '',
    );
  }
}
