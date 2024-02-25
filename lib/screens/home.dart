// import 'package:discover/screens/dashboard.dart';
// import 'package:discover/screens/favourite.dart';
// import 'package:discover/screens/profile.dart';
// import 'package:discover/screens/search.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final homeNavKey = GlobalKey<NavigatorState>();
//   final boardNavKey = GlobalKey<NavigatorState>();
//   final messageNavKey = GlobalKey<NavigatorState>();
//   final profileNavKey = GlobalKey<NavigatorState>();
//   int selectedTab = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomSheet: ,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: IndexedStack(
//             index: selectedTab,
//             children: const [
//               Dashboard(),
//               Search(),
//               Favourite(),
//               Profile(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedTab,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         onTap: (index) {
//           setState(() {
//             selectedTab = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: selectedTab == 0
//                 ? const Icon(Icons.home)
//                 : const Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: selectedTab == 1
//                 ? const Icon(Icons.search)
//                 : const Icon(Icons.search_outlined),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: selectedTab == 2
//                 ? const Icon(Icons.favorite)
//                 : const Icon(Icons.favorite_border_outlined),
//             label: 'Favourites',
//           ),
//           BottomNavigationBarItem(
//             icon: selectedTab == 1
//                 ? const Icon(Icons.person)
//                 : const Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:discover/screens/dashboard.dart';
import 'package:discover/screens/favourite.dart';
import 'package:discover/screens/profile.dart';
import 'package:discover/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  int selectedIndex = 0;

  List<Map<String, dynamic>> bottomItem = [
    {
      "id": 0,
      "name": "Home",
      "activeImg": Icons.home,
      "inActiveImg": Icons.home_outlined,
    },
    {
      "id": 1,
      "name": "Search",
      "activeImg": Icons.search,
      "inActiveImg": Icons.search,
    },
    {
      "id": 2,
      "name": "Favourites",
      "activeImg": Icons.favorite,
      "inActiveImg": Icons.favorite_border_outlined,
    },
    {
      "id": 3,
      "name": "Profile",
      "activeImg": Icons.person,
      "inActiveImg": Icons.person_2_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: showTopItem()),
          showBottomBar(),
        ],
      )),
    );
  }

  showTopItem() {
    if (selectedIndex == 0) {
      return const Dashboard();
    } else if (selectedIndex == 1) {
      return const Search();
    } else if (selectedIndex == 2) {
      return const Favourite();
    } else if (selectedIndex == 3) {
      return const Profile();
    }
  }

  showBottomBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 20),
      child: Row(
        children: bottomItem
            .map<Widget>((e) => Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = e['id'];
                      });
                      log("selectedIndex:$selectedIndex");
                    },
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          selectedIndex == e['id']
                              ? e['activeImg']
                              : e['inActiveImg'],
                          color: selectedIndex == e['id']
                              ? Colors.green
                              : Colors.black,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          e['name'],
                          style: TextStyle(
                            fontSize: 9,
                            color: selectedIndex == e['id']
                                ? Colors.green
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
