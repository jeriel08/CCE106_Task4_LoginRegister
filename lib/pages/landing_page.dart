import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sanao Activity 2',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Landing Page!',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 20),
            Text("Username: $username", style: TextStyle(fontSize: 20)),
            Text("Password: $password", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
