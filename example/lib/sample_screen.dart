// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MeetingJoinScreen extends StatelessWidget {
  final TextEditingController meetingIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  MeetingJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moi Meet'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Network Image at the Top
            Container(
              margin: const EdgeInsets.only(bottom: 32.0),
              child: Image.network(
                'https://meet.aioman.org/images/moi/moi-meet-logo.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),

            // Meeting ID TextField
            TextField(
              controller: meetingIdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Meeting ID',
                hintText: 'Enter Meeting ID',
              ),
            ),

            const SizedBox(height: 16.0),

            // User Name TextField
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Name',
                hintText: 'Enter Your Name',
              ),
            ),

            const Spacer(),

            // Join Now Button at the Bottom
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle join button press here
                  String meetingId = meetingIdController.text;
                  String userName = userNameController.text;
                  // Add logic to join the meeting using meetingId and userName
                  print(
                      'Joining meeting with ID: $meetingId and Username: $userName');
                },
                child: const Text('Join Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
