import 'package:flutter/material.dart';
import 'package:uts/screens/account/account.dart';
import 'package:uts/screens/history/history.dart';
import 'package:uts/screens/homepage/homepage.dart';
import 'package:uts/screens/inbox/inbox.dart';
import 'package:uts/screens/splash_screen/splash_screen.dart';
import 'package:uts/widgets/custom_bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LinkAja Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}

class CustomBottomNavBarWidget extends StatefulWidget {
  const CustomBottomNavBarWidget({super.key});

  @override
  _CustomBottomNavBarWidgetState createState() =>
      _CustomBottomNavBarWidgetState();
}

class _CustomBottomNavBarWidgetState extends State<CustomBottomNavBarWidget> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const HistoryPage(),
    const Placeholder(),
    const InboxPage(), // Placeholder for InboxPage
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
