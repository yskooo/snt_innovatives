import 'package:flutter/material.dart';
import 'dart:math';

class QueueNumberPage extends StatelessWidget {
  final int queueNumber;

  const QueueNumberPage({Key? key, required this.queueNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate a random waiting time (in minutes) based on queueNumber
    Random random = Random();
    int waitingTime = (queueNumber * 0.75 + random.nextInt(15)).toInt();

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
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/90546802?v=4'), // Adjust image as needed
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeaderText('You are now in line'),
            _buildDescriptionText('Sit tight! Your turn is almost here.'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildQueueNumberWidget(),
                ],
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Your number in line: ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '$queueNumber',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A915A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4), // Add some spacing
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Your estimated waiting time: ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '$waitingTime minutes',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A915A),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
            _buildLocationText(context),
            const SizedBox(height: 20),
            _buildActionButtons(context), // Pass context to access Navigator
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
    );
  }

  Widget _buildDescriptionText(String text, {FontWeight fontWeight = FontWeight.normal, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 16,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }


  Widget _buildQueueNumberWidget() {
    // Define the size of the square container
    const double squareSize = 250.0; // Adjust this value to fit your design

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Ensure border width is set to 2
        borderRadius: BorderRadius.circular(8),
      ),
      // Use SizedBox to enforce a fixed size
      child: SizedBox(
        width: squareSize,
        height: squareSize,
        child: FittedBox(
          fit: BoxFit.contain,
          // Ensure alignment to center if that's necessary
          child: Text(
            '$queueNumber',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              // The fontSize can be as large as needed; FittedBox will scale it down appropriately
              fontSize: 200,
            ),
            textAlign: TextAlign.center, // Center text inside the Text widget
          ),
        ),
      ),
    );
  }


  Widget _buildLocationText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 360 ? 14 : 16;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // margin: const EdgeInsets.only(top: 10), // Add margin if required
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
        children: [
          Text(
            'Location:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.location_on_rounded, size: 24),
              const SizedBox(width: 4), // Spacing between icon and text
              Expanded( // Use Expanded to ensure the text fits within the row
                child: Text(
                  'St. Michael Clinic, Malolos, 3000 Bulacan',
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 10.0,
          ),
          child: GestureDetector(
            onTap: () {
              // Continue action
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              // Makes the button take the full width available
              decoration: BoxDecoration(
                color: const Color(0xFF1A915A), // Dark green background
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Continue Appointment",
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
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 15.0,
            bottom: 0,
          ),
          child: GestureDetector(
            onTap: () => Navigator.pop(context), // Go Back action
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              // Makes the button take the full width available
              decoration: BoxDecoration(
                color: const Color(0xFF8CD0CE), // Light teal background
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Go Back",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
