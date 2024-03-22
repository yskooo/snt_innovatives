import 'package:flutter/material.dart';
import 'package:flutter_supabase/main.dart';
import 'package:flutter_supabase/pages/user_profile_page.dart';

import '../components/public_safety_route.dart';
import '../components/raise_concerns_route.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  void _onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
        break;
    case 1:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PublicSafetyRoute()));
      break;
    case 2:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RaiseConcernsRoute()));
      break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserProfilePage()));
        break;
    }
  }

  Widget _animatedIcon(BuildContext context, IconData iconData, int index) {
    bool isSelected = widget.selectedIndex == index;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: isSelected
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
          color: isSelected ? const Color(0xFF1A915A) : Colors.white,
        ),
      ),
    );
  }

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
          BottomNavigationBarItem(
            icon: _animatedIcon(context, Icons.home_outlined, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _animatedIcon(context, Icons.notifications_outlined, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _animatedIcon(context, Icons.message_outlined, 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _animatedIcon(context, Icons.person_outlined, 3),
            label: '',
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: (index) => _onItemTap(context, index),
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
