import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/pages/user_personal_info_widget.dart';
import 'package:flutter_supabase/pages/user_security_info_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/bottom_navigationbar.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  int _selectedIndex = 0; // bottom navigation bar
  int _stackIndex = 0; // user profile

  // Callback function to handle bottom navigation bar item tap
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to change the index of the IndexedStack
  void _changeStackIndex(int newIndex) {
    setState(() {
      _stackIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserProfilePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10), // Adjust horizontal padding as needed
              child: CircleAvatar(
                radius: 24, // Adjust the size of the CircleAvatar as needed
                backgroundColor: Colors.grey[200], // A light background color
                child: const Icon(
                  Icons.settings_outlined, // The outlined settings icon
                  color: Colors.black87, // Icon color
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://scontent.fmnl8-1.fna.fbcdn.net/v/t39.30808-6/370519707_1026008071923134_6003760270648124061_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=V_tmg2OwmTkAX_jqe2T&_nc_ht=scontent.fmnl8-1.fna&oh=00_AfDMp2cGWDKyobu09C4nUKwzc9u6_hX3KDAHtGK0s4q9Yg&oe=65F3E29E'),
                    radius: 50,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Harold Patacsil",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 5.0,
                      bottom: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  _changeStackIndex(0); // Personal Info Index
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  // Remove the width to allow the button to be responsive
                                  decoration: BoxDecoration(
                                    color: _stackIndex == 0 ? const Color(0xFF1A915A) : CupertinoColors.systemGrey6,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    "Personal Info",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _stackIndex == 0 ? Colors.white : Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  _changeStackIndex(1); // Security Info Index
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: _stackIndex == 1 ? const Color(0xFF1A915A) : CupertinoColors.systemGrey6,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    "Security",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _stackIndex == 1 ? Colors.white : Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                        padding: const EdgeInsets.all(20.0),
                            child: IndexedStack(
                              index: _stackIndex,
                              children: const [
                                PersonalInfoWidget(), // Index 0
                                SecurityInfoWidget(), // Index 1
                              ],
                            ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                      top: 0,
                      bottom: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            // onTap: goToLoginPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1), // Shadow color
                                    spreadRadius: 2,  // Spread radius
                                    blurRadius: 5,    // Blur radius
                                    offset: const Offset(0, 3), // Offset in the y direction
                                  ),
                                ],
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info,
                                    color: Colors.black87,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Additional Info",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            // onTap: goToSignupPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1), // Shadow color
                                    spreadRadius: 2,  // Spread radius
                                    blurRadius: 5,    // Blur radius
                                    offset: const Offset(0, 3), // Offset in the y direction
                                  ),
                                ],
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.lock,
                                    color: Colors.black87,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Privacy Settings",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
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
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTap: _onItemTap,
      ),
    );
  }
}



