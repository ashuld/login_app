import 'package:flutter/material.dart';
import 'package:loginapp/screens/home.dart';
import 'package:loginapp/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateTohome(context);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                'https://hotpot.ai/designs/thumbnails/splash-screen/13.jpg'),
          ],
        ),
      ),
    );
  }

  navigateTohome(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    var loggedIn = prefs.getBool('isLogged');
    await Future.delayed(const Duration(seconds: 3));
    if (loggedIn == true) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Homescreen(),
          ));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    }
  }
}