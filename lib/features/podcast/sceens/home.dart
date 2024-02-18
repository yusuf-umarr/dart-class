import 'package:flutter/material.dart';
import 'package:project_update/features/podcast/sceens/podcast_dashboard.dart';
import 'package:project_update/features/task/screens/board.dart';
import 'package:project_update/features/task/screens/dashboard.dart';
import 'package:project_update/features/task/screens/message.dart';
import 'package:project_update/features/task/screens/profile.dart';

class PodCastHome extends StatefulWidget {
  const PodCastHome({super.key});

  @override
  State<PodCastHome> createState() => _PodCastHomeState();
}

class _PodCastHomeState extends State<PodCastHome> {
  int selectedTab = 0;

  List<Widget> pages = [
    const PodcastDashboard(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedTab,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_business,
            ),
            label: 'Board',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
