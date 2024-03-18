import 'package:flutter/material.dart';

class RaiseConcernsRoute extends StatelessWidget {
  const RaiseConcernsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 150, // Adjust height as needed
                color: Colors.tealAccent.shade700, // Adjust color as needed
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                            'Raise Concerns',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.png'), // Adjust image as needed
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2, // 2 cards per row, adjust as needed
                    children: List.generate(
                      8,
                          (index) => Card(
                        child: Center(
                          child: Text('Card ${index + 1}'),
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
