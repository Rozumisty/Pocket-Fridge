import 'package:flutter/material.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PocketHeader(
        backgroundColor: Color.fromARGB(255, 200, 162, 200),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Admin Rozumist',
                style: textStylePofileText,
              ),
              const SizedBox(height: 8),
              const Text(
                'rozumisty.group@gmail.com',
                style: textStylePofileTextEmail,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 200, 162, 200),
                ),
                child: const Text(
                  'Edit',
                  style: textStyleInput,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 200, 162, 200),
                ),
                child: const Text(
                  'Exit Profile',
                  style: textStyleInput,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
