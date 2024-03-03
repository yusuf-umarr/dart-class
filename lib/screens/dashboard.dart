import 'dart:developer';

import 'package:clients_list/constant/color.dart';
import 'package:clients_list/screens/sales.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  showDrawer() {
    return Column(
      children: [
        ListTile(
          title: Text("Home"),
        )
      ],
    );
  }

  mobileView() {
    return Column(
      children: [
        Container(
          child: Text("Size one"),
        ),
        Container(
          child: Text("Size Tow"),
        ),
      ],
    );
  }

  desktopView() {
    return Row(
      children: [
        Container(
          child: Text("Size one"),
        ),
        Container(
          child: Text("Size Tow"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    log("appWidth:$appWidth");
    return Scaffold(
      drawer: showDrawer(),
      backgroundColor: AppColor.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            if (appWidth <= 500) mobileView() else desktopView(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColor.dark,
                        child: Icon(
                          Icons.short_text,
                          color: AppColor.white,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColor.dark,
                            child: Icon(
                              Icons.search,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Team of passionate designers and developers',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 115,
                          child: CircleAvatar(
                            backgroundColor: AppColor.greyBG,
                            radius: 17,
                            child: Center(
                              child: Text(
                                '+2',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/profile2.webp',
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/profile3.webp',
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/profile5.jpg',
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/profile4.png',
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sales(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    height: 355,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                      color: AppColor.dark,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15).copyWith(
                        left: 40,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '54',
                                style: TextStyle(
                                  fontSize: 60,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Daily',
                                      style: TextStyle(
                                        color: AppColor.white,
                                      ),
                                    ),
                                    Text(
                                      'New Clients',
                                      style: TextStyle(
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(71, 222, 221, 221),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_outward,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 260,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        color: AppColor.lightYellow,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15).copyWith(
                          left: 40,
                          top: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '5K',
                                  style: TextStyle(
                                    fontSize: 60,
                                    color: AppColor.fridayColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Clients in',
                                        style: TextStyle(
                                          color: AppColor.fridayColor,
                                        ),
                                      ),
                                      Text(
                                        '2023',
                                        style: TextStyle(
                                          color: AppColor.fridayColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.smallYellow,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_outward,
                                  color: AppColor.dark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        color: AppColor.firstYellow,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15).copyWith(
                          left: 40,
                          top: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2.5K',
                                  style: TextStyle(
                                    fontSize: 60,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '263 Contributions',
                                        style: TextStyle(
                                          color: AppColor.white,
                                        ),
                                      ),
                                      Text(
                                        'in the last year',
                                        style: TextStyle(
                                          color: AppColor.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.secondSmallYellow,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_outward,
                                  color: AppColor.dark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
