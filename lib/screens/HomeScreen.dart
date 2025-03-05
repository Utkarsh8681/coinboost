import 'package:coinboost/screens/profileScreen.dart';
import 'package:coinboost/screens/readNews.dart';
import 'package:coinboost/screens/rewardLevel.dart';
import 'package:coinboost/screens/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeContentScreen(),
    RewardLevel(),
    Profilescreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xfff7931A),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          items: [
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
              icon: Icon(Icons.account_circle, color: Colors.white, size: 40),
              label: "Profile",
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ));
  }
}

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xfff7931A), // Set the status bar color to orange
      statusBarIconBrightness: Brightness.light, // Set icons to light
    ));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile Section
                    Row(
                      children: [
                        Image.asset(
                          "assets/profile.png",
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "John Doe",
                          style: TextStyle(fontSize: 14),
                        ),
                        // SizedBox(
                        //   width: 60,
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/medal.png",
                          height: 25,
                          width: 25,
                        ),
                        // const SizedBox(width: 5),
                        Text("Level 01"),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/wallet.png",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        Text("\$25.00"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 62,
              ),
              Text(
                "Claim Your Daily Reward",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff965200)),
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  RewardContainer(30, 10, Color(0xffF7931A), Colors.white),
                  SizedBox(
                    width: 9,
                  ),
                  RewardContainer(40, 12, Color(0xffF7931A), Colors.white),
                  SizedBox(
                    width: 9,
                  ),
                  RewardContainer(50, 14, Color(0xffF7931A), Colors.white),
                  SizedBox(
                    width: 9,
                  ),
                  RewardContainer(70, 18, Colors.white, Color(0xffF7931A)),
                  SizedBox(
                    width: 9,
                  ),
                  RewardContainer(50, 14, Color(0xffF7931A), Colors.white),
                  SizedBox(
                    width: 9,
                  ),
                  RewardContainer(40, 12, Color(0xffF7931A), Colors.white),
                  SizedBox(
                    width: 9,
                  ),
                  RewardContainer(30, 10, Color(0xffF7931A), Colors.white),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Do Tasks, Earn Reward",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff965200)),
              ),
              SizedBox(
                height: 15,
              ),
              Text("You can do these tasks as many times as you want to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Readnews(
                                    imagePath: 'assets/cooking.png',
                                  )));
                    },
                    child: TaskCard(
                        image: 'assets/cooking.png',
                        title: 'Play Game',
                        reward: '\$10'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Readnews(
                                    imagePath: 'assets/news.png',
                                  )));
                    },
                    child: TaskCard(
                        image: 'assets/news.png',
                        title: 'Read news',
                        reward: '\$5'),
                  ),
                ],
              )))
            ],
          ),
        ),
      ),
    );
  }

  Container RewardContainer(double heig, double fon, Color col, Color tex) {
    return Container(
      height: heig,
      width: heig,
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffF7931A), width: 2),
      ),
      child: Center(
        child: Text(
          "\$2 \nAD",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fon, color: tex),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String image;
  final String title;
  final String reward;

  TaskCard({required this.image, required this.title, required this.reward});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 37.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(image,
                  height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(reward,
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
