import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const FeelingsApp());
}

class FeelingsApp extends StatelessWidget {
  const FeelingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Motivation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MotivationScreen(),
    );
  }
}

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({super.key});

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      'quote': 'Start your day with a smile!',
      'icon': '😊',
      'bg': Colors.teal[100],
    },
    {
      'quote': 'You are stronger than you think!',
      'icon': '🔥',
      'bg': Colors.orange[100],
    },
    {
      'quote': 'Keep shining, you got this!',
      'icon': '🌞',
      'bg': Colors.purple[100],
    },
    {
      'quote': 'One small step every day matters!',
      'icon': '🚶‍♂️',
      'bg': Colors.pink[100],
    },
  ];

  String displayedQuote = "Press the button to get inspired ✨";
  String displayedIcon = "💭";
  Color bgColor = Colors.grey.shade200;

  void generateMessage() {
    final randomIndex = Random().nextInt(messages.length);
    final chosen = messages[randomIndex];

    setState(() {
      displayedQuote = chosen['quote'];
      displayedIcon = chosen['icon'];
      bgColor = chosen['bg'];
    });
  }

  void clearMessage() {
    setState(() {
      displayedQuote = "Press the button to get inspired ✨";
      displayedIcon = "💭";
      bgColor = Colors.grey.shade200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Today's Motivation"),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayedIcon,
              style: const TextStyle(fontSize: 90),
            ),
            Text(
              displayedQuote,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: generateMessage,
                  icon: const Icon(Icons.lightbulb_outline),
                  label: const Text("Inspire Me"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[300],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: clearMessage,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}