import 'package:flutter/material.dart';
import '../widgets/bottom_navigationbar.dart'; // Ensure this import is correct

class JobOpportunitiesRoute extends StatefulWidget {
  const JobOpportunitiesRoute({Key? key}) : super(key: key);

  @override
  State<JobOpportunitiesRoute> createState() => _JobOpportunitiesRouteState();
}

class _JobOpportunitiesRouteState extends State<JobOpportunitiesRoute> {
  int _selectedIndex = 2; // Assuming this is the index for the "Job Opportunities" page

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
            Text('Job Opportunities', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Explore job openings', style: TextStyle(fontSize: 12)),
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
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildJobItem(context, index);
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

  Widget _buildJobItem(BuildContext context, int index) {
    // Placeholder for your actual implementation
    final String jobTitle = 'Software Engineer';
    final String companyName = 'ABC Tech';
    final String location = 'San Francisco, CA';

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
              color: Color(0xFFE69D1E), // Use the desired color
            ),
            child: Center(
              child: Text(
                '${index + 1}', // Display the index starting from 1
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      jobTitle,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle bookmark action
                      },
                      icon: Icon(Icons.bookmark_border),
                    ),
                  ],
                ),
                Text(
                  'Company: $companyName',
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
                      onPressed: () {
                        // Handle button press, e.g., navigate to job details page
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,
                      ),
                      child: const Text('View Details'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press, e.g., apply for the job
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE69D1E),
                      ),
                      child: const Text('Apply Now'),
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
