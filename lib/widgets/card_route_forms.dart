import 'package:flutter/material.dart';
import 'dart:math';

class CardRouteForms extends StatefulWidget {
  final int unitNumber;

  const CardRouteForms({Key? key, required this.unitNumber}) : super(key: key);

  @override
  State<CardRouteForms> createState() => _CardRouteFormsState();
}

class _CardRouteFormsState extends State<CardRouteForms> {
  final _formKey = GlobalKey<FormState>();
  String _address = '';
  String _personInCharge = '';
  String _contact = '';

  void _showQueueNumber() {
    // Generate a random queue number for demo purposes
    final random = Random();
    final queueNumber = random.nextInt(100);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Queue Number'),
        content: Text('Your queue number is: $queueNumber'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Additional actions on continue can be added here
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rural Health Unit ${widget.unitNumber}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
                onSaved: (value) => _address = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Person in Charge'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name of the person in charge';
                  }
                  return null;
                },
                onSaved: (value) => _personInCharge = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Contact'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a contact number';
                  }
                  return null;
                },
                onSaved: (value) => _contact = value ?? '',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Go Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _showQueueNumber();
                      }
                    },
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
