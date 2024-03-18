import 'package:flutter/material.dart';
import 'package:flutter_supabase/widgets/card_route_forms.dart'; // Import the file for the new page

class HealthWellnessRoute extends StatelessWidget {
  const HealthWellnessRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100, // Adjust height as needed
                color: Colors.white, // Adjust color as needed
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Checkup',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/90546802?v=4'), // Adjust image as needed
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.count(
                    crossAxisCount: 2, // 2 cards per row, adjust as needed
                    crossAxisSpacing: 10, // Add spacing between the cards horizontally
                    mainAxisSpacing: 10, // Add spacing between the cards vertically
                    children: List.generate(
                      8,
                          (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => CardRouteForms(unitNumber: index + 1),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
                              const Center(
                                child: Icon(
                                  Icons.local_hospital_rounded,
                                  color: Colors.green,
                                  size: 45.0,
                                ),
                              ),
                              const SizedBox(height: 10), // Adjust the height of the space between icon and text
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10), // Adjust horizontal padding for the text
                                child: Text(
                                  'Rural Health \nUnit ${index + 1}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
