import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_supabase/auth/login.dart';
import 'package:flutter_supabase/auth/signup.dart';

// app bar -> can be reusable component
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 200,
      title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
      ),
      centerTitle: true,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: onBack,
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Main Privacy Policy Component Page
class DataProtectionPrivacyPage extends StatefulWidget {
  const DataProtectionPrivacyPage({super.key});

  @override
  State<DataProtectionPrivacyPage> createState() => _DataProtectionPrivacyPageState();
}

class _DataProtectionPrivacyPageState extends State<DataProtectionPrivacyPage> {
  // Navigate to the login page when disagree is clicked
  void goToLoginPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
  // Navigate to the signup page when agree is clicked
  void goToSignupPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Registration',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white, // Set card color to white
                  elevation: 2, // Add elevation for shadow effect
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("DATA PRIVACY POLICY",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins( // Use Go
                              color: const Color(0xFF1A915A),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 4,
                            )),
                        buildTextWithIndentation(
                          "RA 10173, otherwise known as the Data Privacy Act, seeks to protect the citizens’ right to their personal, sensitive information. By proceeding to answering this form, you agree to submit your own data, which the data manager pledges to not publish or disclose any information without due consent or permission of its owner.",
                        ),
                        const SizedBox(height: 20),
                        buildTextWithIndentation(
                          "I hereby agree to submitting personal information and attest that the information to be provided in this form is complete, true, and correct.",
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 15.0,
                    bottom: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1, // Each Flexible widget gets 1 portion of space
                        child: GestureDetector(
                          onTap: goToLoginPage,
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            // Remove the width to allow the button to be responsive
                            decoration: BoxDecoration(
                              color: const Color(0xFF8CD0CE),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "I DISAGREE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
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
                          onTap: goToSignupPage,
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A915A),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "I AGREE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0,
                    bottom: 0,
                  ),
                  child: SvgPicture.asset(
                    'assets/Images/sidechurch.svg',
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextWithIndentation(String text, {double indentSize = 20.0}) {
  return Text.rich(
    TextSpan(
      children: [
        WidgetSpan(
          child: SizedBox(width: indentSize),
        ),
        TextSpan(text: text),
      ],
    ),
    textAlign: TextAlign.justify,
    style: GoogleFonts.poppins(
      fontSize: 14,
    ),
  );
}