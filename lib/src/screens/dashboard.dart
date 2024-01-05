import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../animations/fade_in.dart';
import '../widgets/app_card.dart';
import '../widgets/increasing_text.dart';
import '../widgets/progress_with_text.dart';
import 'profile.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.sizeOf(context).width / 2) - 35;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),
            greeting(),
            const SizedBox(height: 30),
            cards(w),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget cards( double w) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              activity(),
              const SizedBox(height: 30),
              sleep(w),
              const SizedBox(height: 30),
              hydration(),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: w,
          child: Column(
            children: [
              heartrate(),
              const SizedBox(height: 30),
              calories(),
              const SizedBox(height: 30),
              workOut(),
            ],
          ),
        ),
      ],
    );
  }
  
  FadeInAnimation greeting() {
    return FadeInAnimation(
      delay: 1,
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tue, 2 Jan",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "My Day",
                style: TextStyle(fontSize: 34),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onLongPress: () {
              log('triggered');
              setState(() {});
            },
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => const ProfilePage(),
                ),
              );
            },
            child: SizedBox(
              height: 70,
              width: 70,
              child: Hero(
                tag: const Key('image'),
                child: Container(
                  decoration: const ShapeDecoration(
                    shape: StarBorder(
                      innerRadiusRatio: .9,
                      pointRounding: .2,
                      points: 10,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/model.jpg'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  
  FadeInAnimation activity() {
    return FadeInAnimation(
      delay: 1.5,
      child: AppCard(
        height: 250,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Activity",
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/icons/footprints.png',
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const Expanded(
              child: ProgressWithText(
                value: 2232,
                indicatorValue: .78,
                title: 'steps',
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  
  FadeInAnimation sleep(double w) {
    return FadeInAnimation(
      delay: 2,
      child: AppCard(
        height: w,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Sleep",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Icon(
                  Iconsax.moon,
                  color: Colors.deepPurple,
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IncreasingText(
                    7.21,
                    isSingle: false,
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    "hours",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  FadeInAnimation hydration() {
    return FadeInAnimation(
      delay: 2.5,
      child: AppCard(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("Hydration"),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/icons/waterdrop.png',
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/icons/glass-of-water.png',
                  height: 50,
                ),
              ),
            ),
            const IncreasingText(
              2,
              isSingle: true,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            const Text(
              "glasses",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
  
  
  FadeInAnimation heartrate() {
    return FadeInAnimation(
      delay: 1.5,
      child: AppCard(
        height: 300,
        color: Colors.deepPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Heartrate",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(Iconsax.heart, color: Colors.white),
              ],
            ),
            Expanded(
              child: Image.asset(
                'assets/images/graph.png',
                color: Colors.white,
              ),
            ),
            const IncreasingText(
              98,
              isSingle: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                height: .9,
              ),
            ),
            const Text(
              "bmp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
    
  }
  
  
  FadeInAnimation calories() {
    return FadeInAnimation(
      delay: 2,
      child: AppCard(
        height: 225,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Calories",
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/icons/thunderbolt.png',
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const Expanded(
              child: ProgressWithText(
                indicatorValue: .78,
                title: 'kcal',
                value: 553,
              ),
            ),
          ],
        ),
      ),
    );
    
    
  }
  
  
  FadeInAnimation workOut(){
    return const FadeInAnimation(delay: 2.5,
      child: AppCard(
        height: 155,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Work out",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Icon(
                  Iconsax.speedometer5,
                  color: Colors.deepPurple,
                ),
              ],
            ),
            Spacer(),
            Text(
              "150",
              style: TextStyle(fontSize: 32),
            ),
            Text(
              "min",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );   
    
    
  }

}
