import 'package:flutter/material.dart';
import 'package:flutter_supabase/login.dart';
import 'package:flutter_supabase/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add padding around the SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white, // Set card color to white
                  elevation: 2, // Add elevation for shadow effect
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded corners for the card
                  child: Padding(
                    padding: const EdgeInsets.all(16.0), // Add padding inside the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "RA 10173, otherwise known as the Data Privacy Act, seeks to protect the citizens’ right to their personal, sensitive information. By proceeding to answering this form, you agree to submit your own data, which the data manager pledges to not publish or disclose any information without due consent or permission of its owner.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 20), // Adjust the height value to control the vertical space
                        Text(
                          "I hereby agree to submitting personal information and attest that the information to be provided in this form is complete, true, and correct.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Adjust the height value to control the vertical space
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 15.0,
                    bottom: 0,
                  ),
                  child: GestureDetector(
                    onTap: goToLoginPage, // Navigate to login page when disagree is clicked
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 360,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8CD0CE), // Updated to your specific green color
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "I DISAGREE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 10.0,
                    bottom: 0,
                  ),
                  child: GestureDetector(
                    onTap: goToSignupPage, // Navigate to signup page when agree is clicked
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 360,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A915A), // Updated to your specific green color
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "I AGREE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,         ),
                      ),
                    ),
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