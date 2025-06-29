import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homescreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        // onTap: () {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quran'),
        ],
      ),
    );
  }
}
