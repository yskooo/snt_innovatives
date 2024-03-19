import 'package:flutter/material.dart';
import 'dart:math';

import '../pages/queue_number_page.dart';

class CardRouteForms extends StatefulWidget {
  final int unitNumber;

  const CardRouteForms({Key? key, required this.unitNumber}) : super(key: key);

  @override
  _CardRouteFormsState createState() => _CardRouteFormsState();
}

class _CardRouteFormsState extends State<CardRouteForms> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  String? _selectedPersonInCharge;
  final List<String> _personsInCharge = ['Person 1', 'Person 2', 'Person 3'];

  @override
  void dispose() {
    _addressController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  void _showQueueNumber() {
    final queueNumber = Random().nextInt(100);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QueueNumberPage(queueNumber: queueNumber),
      ),
    );
  }


  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            controller: _addressController,
            hintText: 'St. Michael Clinic, Malolos. 3000 Bulacan',
            validatorMessage: 'Address cannot be empty',
            label: 'Address',
          ),
          const SizedBox(height: 20),
          _buildDropdownField(),
          const SizedBox(height: 20),
          _buildTextField(
            controller: _contactController,
            hintText: '+63 912 345 6789',
            validatorMessage: 'Contact number cannot be empty',
            label: 'Contact',
          ),
          const SizedBox(height: 20),
          _buildActionButtons(),
        ],
      ),
    );
  }


  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String validatorMessage,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8), // Space between label and text field
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            contentPadding: const EdgeInsets.all(12),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
        ),
      ],
    );
  }


  Widget _buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Person in Charge',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8), // Space between label and dropdown
        DropdownButtonFormField<String>(
          value: _selectedPersonInCharge,
          onChanged: (newValue) => setState(() => _selectedPersonInCharge = newValue),
          items: _personsInCharge.map<DropdownMenuItem<String>>((person) {
            return DropdownMenuItem<String>(
              value: person,
              child: Text(person),
            );
          }).toList(),
          decoration: InputDecoration(
            hintText: 'Select the person in charge',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            contentPadding: const EdgeInsets.all(12),
          ),
          validator: (value) => value == null ? 'Please select the person in charge' : null,
        ),
      ],
    );
  }


  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          label: "Go Back",
          color: const Color(0xFF8CD0CE),
          onPressed: () => Navigator.pop(context),
        ),
        _buildActionButton(
          label: "Continue",
          color: const Color(0xFF1A915A),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _showQueueNumber();
            }
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({required String label, required Color color, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkup'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/90546802?v=4'), // Adjust image as needed
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeaderCard(),
            const SizedBox(height: 20),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Icon(Icons.local_hospital_rounded, color: Colors.green, size: 45.0),
            const SizedBox(height: 10),
            Text(
              'Rural Health Unit ${widget.unitNumber}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
