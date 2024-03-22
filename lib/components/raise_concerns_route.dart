import 'package:flutter/material.dart';

class RaiseConcernsRoute extends StatelessWidget {
  const RaiseConcernsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Concerns', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Raise issues & Concerns', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/90546802?v=4'),
          ),
          SizedBox(width: 10), // For some spacing
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center( // Center the Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the items horizontally
                children: [
                  _buildSpecialItem(
                    context,
                    "Report Issues",
                    Icons.warning_amber_outlined,
                    Colors.black87,
                    Color(0xFFE69D1E), // Background color for "Report Issues"
                  ),
                  SizedBox(width: 10), // Space between boxes
                  _buildSpecialItem(
                    context,
                    "Raise Concerns",
                    Icons.campaign_outlined,
                    Colors.black87,
                    Color(0xFFE69D1E), // Background color for "Raise Concerns"
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            // This ListView.builder is now properly aligned below the special items.
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildConcernItem(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialItem(BuildContext context, String text, IconData icon,
      Color textColor, Color backgroundColor) {
    return Container(
      width: 175, // Adjust the width as needed
      height: 175, // Adjust the height as needed
      decoration: BoxDecoration(
        color: backgroundColor,
        // Use the background color passed as a parameter
        borderRadius: BorderRadius.circular(8), // Add some rounding
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor),
          SizedBox(height: 5), // Add space between icon and text
          Text(text, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}

  Widget _buildConcernItem(BuildContext context, int index) {
    // Placeholder data for demonstration
    final String image = 'assets/Images/maloloschurch.svg';
    final String headline = 'Concern #$index: Traffic';
    final String user = 'Mary Grace';
    final String location = 'Malolos City, Bulacan';

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
              image: const DecorationImage(
                image: NetworkImage('https://www.mabeybridge.com/__data/assets/image/0021/5394/varieties/1200.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
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
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      location,
                    ),
                  ],
                ),
                // Row of buttons
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action on button press
                      },
                      child: const Text('Reshare'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
                        side: BorderSide(color: Colors.black, width: 1), // Border color and width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Slightly rounded corners
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Action on button press
                      },
                      child: const Text('Resolved'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xFFE69D1E), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Slightly rounded corners
                        ),
                      ),
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
