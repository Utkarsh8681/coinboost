import 'package:coinboost/components/counterModel.dart';
import 'package:flutter/material.dart';
import 'package:coinboost/screens/homeScreen.dart';
import 'package:coinboost/screens/profileScreen.dart';
import 'package:coinboost/screens/readNews.dart';
import 'package:coinboost/screens/rewardLevel.dart';
import 'package:provider/provider.dart';

class Task extends StatefulWidget {
  // final Function(double) updateReward;
  const Task({
    super.key,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int _selectedIndex = 0;
  bool _showContainer = false;
  double reward = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showContainer = true;
      });
    });
  }

  void _onTabTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => RewardLevel()));
    } else if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Profilescreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/image.png"),
            ),
            if (_showContainer)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 50),
                child: Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(15),
                  shadowColor: Colors.grey,
                  child: Container(
                    height: 87,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFBF1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black, width: 0.6)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.cancel,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 19,
                              ),
                              Text(
                                "\$10.00",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<CounterModel>(context, listen: false)
                                  .incrementReward(10);
                              setState(() {
                                _showContainer = false;
                                // reward = reward + 10;
                              });
                              // Navigator.pop(context, reward);
                            },
                            child: Container(
                              width: 103,
                              height: 33,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFFBF1),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Claim",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xfff7931A),
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
    );
  }
}
