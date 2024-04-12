import 'package:fit4cause/features/home/home.dart';
import 'package:fit4cause/features/ngo/ngo_profile.dart';
import 'package:fit4cause/features/ngo/ngo_screen.dart';
import 'package:fit4cause/features/profile/userProfile_screen.dart';
import 'package:fit4cause/features/welcome/welcome_screen.dart';
import 'package:fit4cause/providers/pedometer_provider.dart';
import 'package:fit4cause/utils/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var id;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PedometerProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: BottomNavigation.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          // AuthPage.id: (context) => AuthPage(),
          HomeScreen.id: (context) => HomeScreen(),
          NGOScreen.id: (context) => NGOScreen(),
          UserProfileScreen.id: (context) => UserProfileScreen(),
          BottomNavigation.id: (context) => BottomNavigation(),
          NGOProfile.id: (context) => NGOProfile(),
        },
      ),
    );
  }
}
