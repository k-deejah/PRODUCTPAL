import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> routeSequence = [
    '/onboarding',
    '/signup',
    '/home',
    '/task-list',
    '/createTask',
    '/profile',
    '/settings',
    '/main-nav',
  ];

  int _currentIndex = 0;

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 5));
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/onboarding');
  }

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProductPal Splash Screen',
      home: Scaffold(
        backgroundColor: Colors.brown.shade200,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image(
                  image: AssetImage('assets/images/splash.jpg'),
                  fit: BoxFit.fill,
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                ),
              ),
              Text(
                'Welcome to ProductPal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '© 2025 ProductPal',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
