import 'package:flutter/material.dart';

class RectangularProgressIndicator extends StatelessWidget {
  final double progress; // Value between 0.0 and 1.0

  const RectangularProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Container
        Container(
          height: 19,
          width: 281,
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xfff7931A), width: 1),
          ),
        ),
        // Progress Bar (Starts from Left)
        Positioned(
          left: 0, // Ensures progress starts from the left side
          child: Container(
            height: 19,
            width: 281 * progress, // Adjust width based on progress
            decoration: BoxDecoration(
              color: Colors.orange, // Progress color
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Percentage Text (Centered)
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "${(progress * 100).toInt()}%", // Convert to percentage
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double progressValue = 0.2; // Example progress (20%)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rectangular Progress Indicator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RectangularProgressIndicator(progress: progressValue),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  progressValue += 0.1; // Increase progress
                  if (progressValue > 1.0) progressValue = 0.0; // Reset if full
                });
              },
              child: const Text("Increase Progress"),
            ),
          ],
        ),
      ),
    );
  }
}
