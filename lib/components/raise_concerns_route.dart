import 'package:flutter/material.dart';

class RaiseConcernsRoute extends StatelessWidget {
  const RaiseConcernsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Concerns', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Raise issues & Concerns', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: const [
          CircleAvatar(
            // Assuming using a placeholder image for UserProfile
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(width: 10), // For some spacing
        ],
      ),
      body: ListView.builder(
        itemCount: 5, // Assuming there are 5 concerns raised
        itemBuilder: (context, index) {
          // Build each concern item
          return _buildConcernItem(context, index);
        },
      ),
    );
  }

  Widget _buildConcernItem(BuildContext context, int index) {
    // Placeholder data for demonstration
    final String image = 'assets/concern_images/image$index.jpg';
    final String headline = 'Concern #$index Headline';
    final String user = 'User Name';
    final String location = 'Location Name';

    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side with image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10), // Horizontal space between image and text
          // Right side with text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Headline
                Text(
                  headline,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                // By user
                Text(
                  'By $user',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                // Location
                Text(
                  'Location: $location',
                ),
                // Row of buttons
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action on button press
                      },
                      child: const Text('Button 1'),
                    ),
                    const SizedBox(width: 10), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Action on button press
                      },
                      child: const Text('Button 2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: const RaiseConcernsRoute()));
}
