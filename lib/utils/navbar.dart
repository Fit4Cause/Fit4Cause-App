import 'package:fit4cause/features/home/home.dart';
import 'package:fit4cause/features/ngo/ngo_screen.dart';
import 'package:fit4cause/features/profile/userProfile_screen.dart';
import 'package:fit4cause/features/rewards/reward_screen.dart';
import 'package:fit4cause/main.dart';
import 'package:fit4cause/providers/pedometer_provider.dart';
import 'package:fit4cause/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});
  static String id = 'bottom_nav';
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  List<IconData> data = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.trophy,
    FontAwesomeIcons.solidUser,
  ];
  List screens = [
    const HomeScreen(),
    const NGOScreen(),
    RewardPage(),
    UserProfileScreen(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    final PedometerModel =
        Provider.of<PedometerProvider>(context, listen: false);

    PedometerModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   elevation: 0,
        //   currentIndex: currentIndex,
        //   onTap: onTap,
        //   selectedItemColor: kgreyColor,
        //   unselectedItemColor: kgreyColor.withOpacity(0.5),
        //   backgroundColor: Colors.white,
        //   // type: BottomNavigationBarType.shifting,
        //   // showSelectedLabels: false,
        //   // showUnselectedLabels: false,
        //   iconSize: 27,
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.stacked_bar_chart), label: "NGO"),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        //   ],
        // ),
        // body: screens[currentIndex],

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            color: kgreyColor,
            child: Container(
              height: 70,
              width: double.infinity,
              child: ListView.builder(
                itemCount: data.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 230),
                      width: 40,
                      decoration: BoxDecoration(
                        border: i == selectedIndex
                            ? const Border(
                                top: BorderSide(width: 3.0, color: kwhiteColor))
                            : null,
                        gradient: i == selectedIndex
                            ? const LinearGradient(
                                colors: [kgreyColor, kgreyColor],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            : null,
                      ),
                      child: Icon(
                        data[i],
                        size: 28,
                        color: i == selectedIndex
                            ? Colors.white
                            : kmutedwhiteColor,
                      ),
                    ),
                  ),
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}
