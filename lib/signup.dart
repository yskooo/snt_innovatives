import 'package:flutter/material.dart';
import 'package:flutter_supabase/login.dart';
import 'package:flutter_supabase/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Main SignUp Component Page
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


  // Dropdown Birthday
  Future<void> _selectBirthday(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        birthdayController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  // Dropdown Marital Status
  String? selectedMaritalStatus;
  final List<String> maritalStatuses = [
    'Single',
    'Married',
    'Divorced',
    'Widowed',
    'Separated',
    'Other',
  ];

// Dropdown Gender
  String? selectedGender;
  List<String> genders = ['Male', 'Female', 'Other'];

// Dropdown of Employment
  String? selectedEmploymentType;
  List<String> employmentTypes = ['Full-time', 'Part-time', 'Self-employed', 'Unemployed'];

  @override
  void initState() {
    super.initState();
    selectedMaritalStatus = null; // Default value
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Adjust the height value to control the vertical space
                Text(
                  "PERSONAL INFORMATION",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1A915A),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    height: 0,
                  ),
                ),
                // Personal Information Form Fields
                _buildTextField(
                  controller: surnameController,
                  hintText: 'Surname',
                ),
                _buildTextField(
                  controller: firstNameController,
                  hintText: 'First Name',
                ),
                _buildTextField(
                  controller: middleNameController,
                  hintText: 'Middle Name',
                ),
                GestureDetector(
                  onTap: () => _selectBirthday(context),
                  child: AbsorbPointer(
                    child: _buildTextField(
                      controller: birthdayController,
                      hintText: 'Birthday',
                    ),
                  ),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
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
                    contentPadding: const EdgeInsets.all(14),
                  ),
                  value: selectedMaritalStatus,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMaritalStatus = newValue;
                      if (newValue != 'Other') {
                        maritalStatusController.clear();
                      }
                    });
                  },
                  hint: const Text("Marital Status"), // Placeholder text as a hint
                  items: maritalStatuses.map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
                _buildTextField(
                  controller: homeAddressController,
                  hintText: 'Home Address',
                ),
                _buildTextField(
                  controller: barangayController,
                  hintText: 'Barangay',
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
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
                    contentPadding: const EdgeInsets.all(14),
                  ),
                  value: selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  items: genders.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text("Select Gender"),
                ),
                _buildTextField(
                  controller: contactNumberController,
                  hintText: 'Contact Number',
                ),
                const SizedBox(height: 20),
                Text(
                  "EMPLOYMENT",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1A915A),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
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
                    contentPadding: const EdgeInsets.all(14),
                  ),
                  value: selectedEmploymentType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedEmploymentType = newValue;
                    });
                  },
                  items: employmentTypes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text("Employment Type"),
                ),
                _buildTextField(
                  controller: companyNameController,
                  hintText: 'Company Name',
                ),
                _buildTextField(
                  controller: companyAddressController,
                  hintText: 'Company Address',
                ),
                _buildTextField(
                  controller: monthlyIncomeController,
                  hintText: 'Monthly Income',
                ),
                const SizedBox(height: 20),
                Text(
                  "LEGAL INFORMATION",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1A915A),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    height: 0,
                  ),
                ),
                _buildTextField(
                  controller: governmentIdController,
                  hintText: 'Government ID',
                ),
                _buildTextField(
                  controller: educationController,
                  hintText: 'Highest Education Attainment',
                ),
                _buildTextField(
                  controller: schoolController,
                  hintText: 'School/University',
                ),
                _buildTextField(
                  controller: courseController,
                  hintText: 'Course',
                ),
                // Health Information Form Fields
                const SizedBox(height: 20),
                Text(
                  "HEALTH INFORMATION",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1A915A),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    height: 0,
                  ),
                ),
                _buildTextField(
                  controller: weightController,
                  hintText: 'Weight (kg)',
                ),
                _buildTextField(
                  controller: heightController,
                  hintText: 'Height (cm)',
                ),
                _buildTextField(
                  controller: diseaseController,
                  hintText: 'Disease ("None")',
                ),
                _buildTextField(
                  controller: medicationController,
                  hintText: 'Medication ("N/A")',
                ),
                const SizedBox(height: 20),
                Text(
                  "ACCOUNT",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1A915A),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    height: 0,
                  ),
                ),
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              color: Colors.blueGrey.shade300,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.indigo.shade300,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: Color(0xFF1A915A),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
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
    bool isDropdown = false, // New parameter
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.top,
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
          suffixIcon: isDropdown
              ? const Icon(Icons.arrow_drop_down, color: Colors.grey) // Dropdown icon
              : null,
          hintStyle: const TextStyle(
            fontSize: 12.0,
            color: Colors.blueGrey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          alignLabelWithHint: true,
        ),
        readOnly: isDropdown, // Make field read-only if it's a dropdown
      ),
    );
  }
}


// App bar -> can be a reusable component
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
