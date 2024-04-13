import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit4cause/features/auth/auth_screen.dart';
import 'package:fit4cause/features/home/home.dart';
import 'package:fit4cause/features/ngo/ngo_profile.dart';
import 'package:fit4cause/features/ngo/ngo_screen.dart';
import 'package:fit4cause/features/profile/userProfile_screen.dart';
import 'package:fit4cause/features/welcome/welcome_screen.dart';
import 'package:fit4cause/firebase_options.dart';
import 'package:fit4cause/providers/googleSignIn_provider.dart';
import 'package:fit4cause/providers/pedometer_provider.dart';
import 'package:fit4cause/providers/user_provider.dart';
import 'package:fit4cause/utils/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    print(user);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PedometerProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: user == null ? WelcomeScreen.id : BottomNavigation.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          AuthPage.id: (context) => AuthPage(),
          HomeScreen.id: (context) => HomeScreen(),
          NGOScreen.id: (context) => NGOScreen(),
          UserProfileScreen.id: (context) => UserProfileScreen(),
          BottomNavigation.id: (context) => BottomNavigation(),
          NGOProfile.id: (context) => NGOProfile(),
        },
        // home: WelcomeScreen(),
      ),
    );
  }
}
