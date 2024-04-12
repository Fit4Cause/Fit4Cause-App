import 'package:fit4cause/utils/button.dart';
import 'package:fit4cause/utils/const.dart';
import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class NGOProfile extends StatefulWidget {
  const NGOProfile({super.key});
  static String id = "NGOProfile";

  @override
  State<NGOProfile> createState() => _NGOProfileState();
}

class _NGOProfileState extends State<NGOProfile> {
  @override
  Future<void> DialogCard(BuildContext context) {
    {
      return showDialog(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset("assets/share.png", fit: BoxFit.cover),
          );
        },
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kgreyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 340,
                  child: Image.asset(
                    "assets/ngo-profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: kgreyColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 3,
                        color: kgreyColor,
                      )
                    ],
                  ),
                  height: 35,
                  width: double.infinity,
                ),
                Positioned(
                    top: 55,
                    left: 22,
                    child: CircleAvatar(
                      backgroundColor: kgreyColor,
                      radius: 24,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: kwhiteColor,
                      ),
                    )),
              ],
            ),
            Container(
              width: double.infinity,
              color: kgreyColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Smile Foundation",
                      style: TextStyle(
                          color: kwhiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: kmutedwhiteColor,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Gurugram, India",
                          style: TextStyle(color: kmutedwhiteColor),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: kgreenColor,
                          size: 20,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Details",
                          style: TextStyle(
                              color: kwhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Established in 2002, Smile Foundation is an Indian development organization, impacting the lives of over 15 lakh children and their families every year. We have more than 400 projects on education, healthcare, livelihood, and women empowerment in over 2,000 remote villages and urban slums across 25 states of India.",
                      style: TextStyle(color: kmutedwhiteColor, fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Users who have donated",
                      style: TextStyle(
                          color: kwhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage(
                            "assets/user1.jpg",
                          ),
                        ),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage(
                            "assets/user2.jpg",
                          ),
                        ),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage(
                            "assets/user3.jpg",
                          ),
                        ),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage(
                            "assets/user4.jpg",
                          ),
                        ),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage(
                            "assets/user5.jpg",
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Center(
                        child: PrimaryButton(
                            text: "            Donate            ",
                            onpressed: () {
                              Alert(
                                  context: context,
                                  image: Image.asset("assets/share.png"),
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 8),
                                  closeIcon: const Icon(Icons.abc, size: 0),
                                  buttons: [
                                    DialogButton(
                                      onPressed: () => null,
                                      color: kgreenColor,
                                      child: const Text(
                                        "Share",
                                        style: TextStyle(
                                            color: kgreyColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ]).show();
                            },
                            color: kgreenColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
