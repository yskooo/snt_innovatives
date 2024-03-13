import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({Key? key}) : super(key: key);

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  // Simulate user data - replace these with actual data fetching from Supabase
  final Map<String, dynamic> userData = {
    "firstname": "Harold Patacsil",
    "birthday": "Aug 24, 2004",
    "age": 19,
    "contactNumber": "+123456789",
    "permanentAddress": "123 Main St, Anytown, AT 12345"
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1A915A), width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10), //
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField('First Name', userData['firstname']),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField('Birthday', userData['birthday']),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: _buildTextField('Age', '${userData['age']}'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTextField('Contact Number', userData['contactNumber']),
                const SizedBox(height: 20),
                _buildTextField(
                    'Permanent Address', userData['permanentAddress']),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Edit Account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Add some vertical spacing between label and text field
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color(0xFF1A915A), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color(0xFF1A915A), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color(0xFF1A915A), width: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}