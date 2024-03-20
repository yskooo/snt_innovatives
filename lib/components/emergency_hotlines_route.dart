import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmergencyHotlinesRoute extends StatelessWidget {
  EmergencyHotlinesRoute({Key? key}) : super(key: key);

  final List<Contact> contactInfo = [
    Contact("Police Station", "0933-610-4327", 'assets/Images/police_station.svg'),
    Contact("Fire Station", "0917-847-5757", 'assets/Images/fire_station.svg'),
    Contact("PDRRM", "0933-610-4327", 'assets/Images/pdrrm.svg'),
    Contact("CSWDO", "0933-610-4327", 'assets/Images/cswdo.svg'),
    Contact("Malolos City PIO", "0933-610-4327", 'assets/Images/malolos_city_pio.svg'),
    Contact("Hospital", "0933-610-4327", 'assets/Images/hospital.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotlines'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            crossAxisSpacing: 10.0, // Adjust spacing as needed
            mainAxisSpacing: 10.0, // Adjust spacing as needed
          ),
          itemCount: contactInfo.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1.0, // Optional: adds shadow to each card
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                children: [
                  SvgPicture.asset(
                    contactInfo[index].svgPath,
                    width: 100, // Adjust the size as needed
                    height: 100, // Adjust the size as needed
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      contactInfo[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(contactInfo[index].number),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String number;
  final String svgPath;

  Contact(this.name, this.number, this.svgPath);
}
