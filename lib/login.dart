import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';
import 'data_protection_privacy.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  Future<void> signIn() async {
    try {
      await supabase.auth.signInWithPassword(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
      );
      if (!mounted) return;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
    } on AuthException catch (e) {
      debugPrint(e.message);
    }

    if (_formKey.currentState!.validate()) {
      // Your sign-in logic here
      if (kDebugMode) {
        print('Email: ${emailController.text}');
      }
      if (kDebugMode) {
        print('Password: ${passwordController.text}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/Images/maloloschurch.svg',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "weConnect",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                      height: 0,
                    ),
                  ),
                  Text(
                    "Connection Malolos, Empowering Governance",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      height: 1,
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(51),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white70),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white70),
                          ),
                          hintStyle: const TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15.0,
                      bottom: 0,
                    ),                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(51),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white70),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white70),
                          ),
                          hintStyle: const TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                            const Text(
                              'Remember Me',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Forgot password tap action
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15.0,
                      bottom: 0,
                    ),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 360,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8CD0CE),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "LOG IN",
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 10.0,
                      bottom: 0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DataProtectionPrivacyPage()),
                          );
                        },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 360,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A915A),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "REGISTER",
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
          ),
        ),
      ),
    );
  }
}