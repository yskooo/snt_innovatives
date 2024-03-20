import 'package:flutter/material.dart';

class PublicSafetyRoute extends StatelessWidget {
  const PublicSafetyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Alerts & Announcements', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(width: 10), // For some spacing
        ],
      ),
      body: ListView.builder(
        itemCount: 5, // Assuming there are 5 notifications
        itemBuilder: (context, index) {
          return NotificationCard(
            title: 'System Update',
            content: 'A new system update is available. Please update your app for the best experience.',
            dateTime: DateTime.now().subtract(const Duration(hours: 1)),
            onTap: () {
              // Handle tap on notification
            },
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String content;
  final DateTime dateTime;
  final VoidCallback onTap;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.content,
    required this.dateTime,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDateTime(dateTime),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}

