import 'package:flutter/material.dart';
import 'package:islami/app_image.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/componants/navbar_icon.dart';
import 'package:islami/componants/navbar_active_icon.dart'; // Make sure you import this

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text('Quran')),
    Center(child: Text('Hadeth')),
    Center(child: Text('Sebha')),
    Center(child: Text('Radio')),
    Center(child: Text('Time')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.primary,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 0,
        showUnselectedLabels: true,
        selectedItemColor: AppTheme.white,
        unselectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: NavbarIcon(image: AppImage.navbarQuran),
            activeIcon: NavbarActiveIcon(image: AppImage.navbarQuran),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavbarIcon(image: AppImage.navbarHadeth),
            activeIcon: NavbarActiveIcon(image: AppImage.navbarHadeth),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavbarIcon(image: AppImage.navbarSebha),
            activeIcon: NavbarActiveIcon(image: AppImage.navbarSebha),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: NavbarIcon(image: AppImage.navbarRadio),
            activeIcon: NavbarActiveIcon(image: AppImage.navbarRadio),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavbarIcon(image: AppImage.navbarTime),
            activeIcon: NavbarActiveIcon(image: AppImage.navbarTime),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
