import 'package:flutter/material.dart';

void main() {
  runApp(const RemindersApp());
}

class RemindersApp extends StatelessWidget {
  const RemindersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacing = 20;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                'Welcome to\nReminders',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: spacing * 1.5),
              const FeatureTile(
                icon: Icons.bolt,
                iconColor: Colors.green,
                title: 'Quick Creation',
                description:
                    'Simply type in your list, ask Siri, or add a reminder from your Calendar app.',
              ),
              const FeatureTile(
                icon: Icons.shopping_basket,
                iconColor: Colors.orange,
                title: 'Grocery Shopping',
                description:
                    'Create a Grocery List that automatically sorts items you add by category.',
              ),
              const FeatureTile(
                icon: Icons.people_alt,
                iconColor: Colors.amber,
                title: 'Easy Sharing',
                description:
                    'Collaborate on a list, and even assign individual tasks.',
              ),
              const FeatureTile(
                icon: Icons.grid_view,
                iconColor: Colors.blue,
                title: 'Powerful Organization',
                description:
                    'Create new lists to match your needs, categorize reminders with tags, and manage reminders around your workflow with Smart Lists.',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}