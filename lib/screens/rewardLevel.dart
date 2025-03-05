import 'package:coinboost/components/counterModel.dart';
import 'package:coinboost/components/progressIndicator.dart';
import 'package:coinboost/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardLevel extends StatelessWidget {
  const RewardLevel({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final reward = Provider.of<CounterModel>(context).reward;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 48.0,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns back button left
            children: [
              SizedBox(height: 20), // Adds spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (_) => HomeScreen()));
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color(0xfff7931A))),
                  SizedBox(width: 30), // Space between icon & text
                  Text("Rewarding Levels",
                      style: TextStyle(
                          color: Color(0xfff7931A),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              RwardCard(
                max: 50,
                level: 1,
                reward: reward,
              ),
              RwardCard(
                max: 100,
                level: 2,
                reward: 0,
              ),
              RwardCard(
                max: 150,
                level: 3,
                reward: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RwardCard extends StatelessWidget {
  const RwardCard({
    super.key,
    required this.level,
    required this.reward,
    required this.max,
    // required this.rew,
  });

  final int level;
  final double max;
  final double reward;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 31.0),
      child: Container(
        height: 172,
        width: 343,
        decoration: BoxDecoration(
          color: const Color(0xfff7931A), // Moved inside BoxDecoration
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                "Level ${level}",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: .5, left: .5, right: .5),
              child: Container(
                height: 137,
                width: 342,
                decoration: BoxDecoration(
                  color: Colors.white, // Moved inside BoxDecoration
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 27),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimum Withdrawl =  \$${max}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff7931A)),
                      ),
                      Text(
                        "Your Earnings = \$${reward}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      RectangularProgressIndicator(progress: reward / 50)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
