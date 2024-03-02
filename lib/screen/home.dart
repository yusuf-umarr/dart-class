import 'dart:developer';

import 'package:carry_go/constant/color.dart';
import 'package:carry_go/screen/dashboard.dart';
import 'package:carry_go/screen/history.dart';
import 'package:carry_go/screen/profile.dart';
import 'package:carry_go/screen/request.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      "name": "Request",
      "activeImg": Icons.recycling,
      "inActiveImg": Icons.recycling,
    },
    {
      "id": 2,
      "name": "History",
      "activeImg": Icons.view_headline,
      "inActiveImg": Icons.view_headline,
    },
    {
      "id": 3,
      "name": "Profile",
      "activeImg": Icons.person,
      "inActiveImg": Icons.person,
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
      return const Request();
    } else if (selectedIndex == 2) {
      return const History();
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
                      children: [
                        Icon(
                          selectedIndex == e['id']
                              ? e['activeImg']
                              : e['inActiveImg'],
                          color: selectedIndex == e['id']
                              ? AppColors.primaryColor
                              : AppColors.dark,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 2,
                          width: 35,
                          color: selectedIndex == e['id']
                              ? AppColors.primaryColor
                              : AppColors.dark,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          e['name'],
                          style: TextStyle(
                            fontSize: 15,
                            color: selectedIndex == e['id']
                                ? AppColors.primaryColor
                                : AppColors.dark,
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
