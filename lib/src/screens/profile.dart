import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../animations/fade_in.dart';
import '../widgets/increasing_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildTopBar(context),
            FadeInAnimation(
              delay: 2.5,
              child: _buildProfilePicture(),
            ),
            _buildProfileInfo(),
            const SizedBox(height: 20),
            FadeInAnimation(
              delay: 2.5,
              child: _buildFollowersFollowing(),
            ),
            const SizedBox(height: 20),
            Expanded( // Stellt sicher, dass dieser Teil den restlichen Platz einnimmt
              child: FadeInAnimation(
                delay: 2.5,
                child: _buildOptionsList(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const Icon(Iconsax.setting),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: FractionallySizedBox(
        widthFactor: .6,
        child: Hero(
          tag: const Key("image"),
          child: Container(
            height: 280,
            width: 280,
            decoration: const ShapeDecoration(
              shape: StarBorder(
                innerRadiusRatio: .9,
                pointRounding: .3,
                points: 12,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/model.jpg'),
                fit: BoxFit.cover,
              ),
              shadows: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 120,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children:  [
        const Text(
          "Yuji Itadori",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(122),
            color: Colors.deepPurple.shade50,
          ),
          child: const Text(
            "Sorcerer",
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }

  Widget _buildFollowersFollowing() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IncreasingText(
              23.51,
              suffix: "M",
              isSingle: false,
              style: TextStyle(
                color: Colors.deepPurple.shade500, // 'const' entfernt
                fontSize: 26,
              ),
            ),
            Text(
              "Followers",
              style: TextStyle(color: Colors.deepPurple.shade500), // 'const' entfernt
            ),
          ],
        ),
        const SizedBox(width: 40),
        Column(
          children: [
            IncreasingText(
              467,
              isSingle: true,
              style: TextStyle(
                color: Colors.deepPurple.shade500, // 'const' entfernt
                fontSize: 26,
              ),
            ),
            Text(
              "Following",
              style: TextStyle(color: Colors.deepPurple.shade500), // 'const' entfernt
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOptionsList() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(80),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 100,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildOption(Iconsax.verify5, "Become a Pro Member"),
            _buildOption(Iconsax.activity, "Activity"),
            _buildOption(Iconsax.book, "WorkOut Plans"),
            _buildOption(Iconsax.message, "Help", color: Colors.deepPurple.shade400),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title, {Color? color}) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: color ?? Colors.black,
        ),
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }
}
