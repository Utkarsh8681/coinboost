import 'package:coinboost/screens/rewardLevel.dart';
import 'package:flutter/material.dart';
import 'package:coinboost/screens/task.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

class Readnews extends StatefulWidget {
  const Readnews({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<Readnews> createState() => _ReadnewsState();
}

class _ReadnewsState extends State<Readnews> {
  int _selectedIndex = 0;
  double reward = 0.0;

  void _onTabTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => RewardLevel()));
    } else if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => RewardLevel()));
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xfff7931A), // Set the status bar color to orange
      statusBarIconBrightness: Brightness.light, // Set icons to light
    ));
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 50),
                  Icon(Icons.arrow_back_ios_new, color: Color(0xfff7931A)),
                  SizedBox(width: 90),
                  Text(
                    "Read News",
                    style: TextStyle(
                      color: Color(0xfff7931A),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.imagePath,
                  height: 185,
                  width: 358,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 41.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 59),
                  const Text(
                    "Rules of Task",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 39),
                  const Text("1. Keep scrolling for 10 minutes."),
                  const Text("2. Keep clicking every 30 seconds."),
                  const Text(
                      "3. Don't leave the screen idle for more than 30 seconds."),
                  const SizedBox(height: 42),
                  Material(
                    elevation: 7,
                    borderRadius: BorderRadius.circular(15),
                    shadowColor: Colors.grey.shade300,
                    child: GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Task()),
                        );

                        if (result != null && result is double) {
                          setState(() {
                            reward += result; // Update reward
                          });
                        }
                      },
                      child: Container(
                        height: 48,
                        width: 192,
                        decoration: BoxDecoration(
                          color: const Color(0xfff7931A),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Start Task",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xfff7931A),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.layers, color: Colors.white, size: 40),
              label: "Play",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white, size: 40),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
