import 'package:flutter/material.dart';
import 'package:flutter_supabase/login.dart';
import 'package:flutter_supabase/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController barangayController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  TextEditingController employmentTypeController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController monthlyIncomeController = TextEditingController();

  TextEditingController governmentIdController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController courseController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController diseaseController = TextEditingController();
  TextEditingController medicationController = TextEditingController();

  // Sign Up User
  Future<void> signUp() async {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      try {
        await supabase.auth.signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        if (!mounted) return;

        // Assuming you want to navigate to a different page after signing up
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } on AuthException catch (e) {
        debugPrint(e.message);
      }
    } else {
      // Handle password mismatch
      debugPrint('Passwords do not match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Adjust the height value to control the vertical space
                Text("PERSONAL INFORMATION",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins( // Use Go
                      color: const Color(0xFF1A915A),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      height: 0,
                    )),
                // Personal Information Form Fields
                _buildTextField(
                    controller: surnameController, hintText: 'Surname'),
                _buildTextField(
                    controller: firstNameController, hintText: 'First Name'),
                _buildTextField(
                    controller: middleNameController, hintText: 'Middle Name'),
                _buildTextField(
                    controller: birthdayController, hintText: 'Birthday'),
                _buildTextField(controller: ageController, hintText: 'Age'),
                _buildTextField(controller: maritalStatusController,
                    hintText: 'Marital Status'),
                _buildTextField(controller: homeAddressController,
                    hintText: 'Home Address'),
                _buildTextField(
                    controller: barangayController, hintText: 'Barangay'),
                _buildTextField(
                    controller: genderController, hintText: 'Gender'),
                _buildTextField(controller: contactNumberController,
                    hintText: 'Contact Number'),
                // Employment Information Form Fields
                const SizedBox(height: 20),
                Text("EMPLOYMENT",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1A915A),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      height: 0,
                    )),
                _buildTextField(controller: employmentTypeController, hintText: 'Type of Employment'),
                _buildTextField(controller: companyNameController, hintText: 'Company Name'),
                _buildTextField(controller: companyAddressController, hintText: 'Company Address'),
                _buildTextField(controller: monthlyIncomeController, hintText: 'Monthly Income'),

                // Legal Information Form Fields
                const SizedBox(height: 20),
                Text("LEGAL INFORMATION",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1A915A),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      height: 0,
                    )),
                _buildTextField(controller: governmentIdController, hintText: 'Government ID'),
                _buildTextField(controller: educationController, hintText: 'Highest Education Attainment'),
                _buildTextField(controller: schoolController, hintText: 'School/University'),
                _buildTextField(controller: courseController, hintText: 'Course'),

                // Health Information Form Fields
                const SizedBox(height: 20),
                Text("HEALTH INFORMATION",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1A915A),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      height: 0,
                    )),
                _buildTextField(controller: weightController, hintText: 'Weight (kg)'),
                _buildTextField(controller: heightController, hintText: 'Height (cm)'),
                _buildTextField(controller: diseaseController, hintText: 'Disease'),
                _buildTextField(controller: medicationController, hintText: 'Medication'),

                const SizedBox(height: 20),
                Text("ACCOUNT",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1A915A),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      height: 0,
                    )),
                // Email TextField
                _buildTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                ),
                // Password TextField
                _buildTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
                // Confirm Password TextField
                _buildTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm your password',
                  obscureText: true,
                ),
                // Sign Up Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A915A),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
                                text: "Login",
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.top, // Correct placement
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(51),
            borderSide: const BorderSide(color: Colors.black54),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(51),
            borderSide: const BorderSide(color: Colors.black54),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(51),
            borderSide: const BorderSide(color: Colors.black54),
          ),
          hintStyle: const TextStyle(fontSize: 12.0, color: Colors.blueGrey),
          contentPadding: const EdgeInsets.all(12),
          // Align label with hint is still valid for when the label/hint is displayed inside the text field
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
