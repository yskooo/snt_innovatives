import 'package:flutter/material.dart';
import 'package:flutter_supabase/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Sign In User
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
  }

  @override
  Widget build(BuildContext context) {
    bool rememberMe = false;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Images/maloloschurch.svg',
                  width: 200,
                  height: 200,
                ),
                Text("weConnect",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins( // Use GoogleFonts to specify the Poppins font
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                      height: 0,
                    )),
                Text("Connection Malolos, Empowering Governance",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins( // Also Poppins for the description
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      height: 0,
                    )),
                SizedBox(height: 40), // Adjust the height value to control the vertical space
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                          borderSide: const BorderSide(
                            color: Colors.white70,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.white70),
                        ),
                        hintStyle: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 5.0,
                    bottom: 0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(51),
                      border: Border.all(color: Colors.black54),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.white70,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.white70),
                        ),
                        hintStyle: const TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 0,
                    bottom: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (bool? value) {
                              // Update the rememberMe state
                            },
                          ),
                          const Text('Remember Me'),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Forgot password tap action
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
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
                  ),                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 360,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A915A), // Updated to your specific green color
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "LOG IN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                    },
                    child: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: "Already have an account?",
                              style:
                                  TextStyle(color: Colors.blueGrey.shade300, fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: ' ',
                              style:
                                  TextStyle(color: Colors.indigo.shade300, fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            const TextSpan(
                              text: "Register",
                              style: TextStyle(
                                  color: Color(0xFF1A915A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}