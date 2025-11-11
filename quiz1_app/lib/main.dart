import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const RandomQuoteApp());
  
}

class RandomQuoteApp extends StatelessWidget {
  const RandomQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const QuotePage(),
  
    );
  }
}

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final List<Map<String, dynamic>> quotes = [
    {
      'text': 'You can do it!',
      'emoji': '🚀',
    },
    {
      'text': 'Keep going!',
      'emoji': '💪',
      
    },
    {
      'text': 'Believe in yourself!',
      'emoji': '🌟',
   
    },
  ];

  String currentText = 'Tap "New Quote" to get motivated!';
  String currentEmoji = '❓';
  Color currentColor = Colors.grey[100]!;

  void showNewQuote() {
    final random = Random();
    final selected = quotes[random.nextInt(quotes.length)];
    setState(() {
      currentText = selected['text'];
      currentEmoji = selected['emoji'];
      currentColor = selected['color'];
    });
  }

  void reset() {
    setState(() {
      currentText = 'Tap "New Quote" to get motivated!';
      currentEmoji = '❓';
      currentColor = Colors.grey[300]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(
        title: const Text('How Do You Feel Today?'),
        backgroundColor: Colors.brown[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              currentEmoji,
              style: const TextStyle(fontSize: 70),
            ),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: showNewQuote,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[200]),
                  child: const Text('New Quote'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[100]),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}