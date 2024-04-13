import 'package:fit4cause/features/auth/auth_screen.dart';
import 'package:fit4cause/providers/pedometer_provider.dart';
import 'package:fit4cause/utils/button.dart';
import 'package:fit4cause/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Consumer<PedometerProvider>(
      builder: (context, PedometerModel, child) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/welcomebg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 50),
                    child: PrimaryButton(
                      color: kgreyColor,
                      text: "Continue",
                      onpressed: () {
                        PedometerModel.getPermission();
                        Navigator.pushNamed(context, AuthPage.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
