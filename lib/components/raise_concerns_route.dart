import 'package:flutter/material.dart';
import '../widgets/bottom_navigationbar.dart'; // Ensure this import is correct

class RaiseConcernsRoute extends StatefulWidget {
  const RaiseConcernsRoute({Key? key}) : super(key: key);

  @override
  State<RaiseConcernsRoute> createState() => _RaiseConcernsRouteState();
}

class _RaiseConcernsRouteState extends State<RaiseConcernsRoute> {
  int _selectedIndex = 2; // Assuming this is the index for the "Raise Concerns" page

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/90546802?v=4'),
          ),
          SizedBox(width: 10), // For some spacing
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSpecialItem(
                    context,
                    "Report Issues",
                    Icons.warning_amber_outlined,
                    Colors.black87,
                    Color(0xFFE69D1E),
                  ),
                  SizedBox(width: 10),
                  _buildSpecialItem(
                    context,
                    "Raise Concerns",
                    Icons.campaign_outlined,
                    Colors.black87,
                    Color(0xFFE69D1E),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildConcernItem(context, index);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        // onItemTap: _onItemTap,
      ),
    );
  }

  Widget _buildSpecialItem(BuildContext context, String text, IconData icon, Color textColor, Color backgroundColor) {
    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor),
          SizedBox(height: 5),
          Text(text, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }

  Widget _buildConcernItem(BuildContext context, int index) {
    // Placeholder for your actual implementation
    final String headline = 'Concern #$index: Traffic';
    final String user = 'Mary Grace';
    final String location = 'Malolos City, Bulacan';

    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage('https://www.mabeybridge.com/__data/assets/image/0021/5394/varieties/1200.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headline,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'By $user',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.black54),
                    const SizedBox(width: 5),
                    Text(location),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Reshare'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Resolved'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFE69D1E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
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
}
