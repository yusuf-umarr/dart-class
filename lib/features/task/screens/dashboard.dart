import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_update/auth/auth_view_model.dart';
import 'package:project_update/features/task/models/school_model.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();

  int selectedContainerIndex = 0;

  // selectedContainerIndex

  List<Map<String, dynamic>> recentTaskList = [
    {
      "id": 0,
      "title": "Landing Page Design",
      "dateTime": "Today, 10:31 AM",
      "img1": "assets/profile.jpg",
      "img2": "assets/profile4.png",
      "img3": "assets/profile5.jpg",
    },
    {
      "id": 1,
      "title": "Improvement Color",
      "dateTime": "31, March 2023, 10:31 AM",
      "img1": "assets/profile.jpg",
      "img2": "assets/profile2.jpg",
      "img3": "assets/profile3.jpg",
    },
    {
      "id": 2,
      "title": "Home Banking Mobile App",
      "dateTime": "1 April, 10:31 AM",
      "img1": "assets/profile4.png",
      "img2": "assets/profile6.png",
      "img3": "assets/profile5.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          homeHeader(),
          const SizedBox(
            height: 10,
          ),
          searchBar(),
          const SizedBox(
            height: 10,
          ),
          seeAllWidget(title: 'Projects'),
          const SizedBox(
            height: 10,
          ),
          projectRow(),
          seeAllWidget(title: 'Recent Tasks'),
          const SizedBox(
            height: 10,
          ),
          showRecentTask(),
        ],
      ),
    );
  }

  showRecentTask() {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: recentTaskList.map((e) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedContainerIndex = e['id'];
              log("selectedContainerIndex:$selectedContainerIndex");
            });
          },
          child: Container(
            width: 370,
            height: 60,
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.only(left: 10, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 6,
                  blurRadius: 4,
                  offset: const Offset(10, 10),
                ),
              ],
              border: Border.all(
                color: Colors.grey,
                width: 0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedContainerIndex == e["id"]
                                ? Colors.transparent
                                : Colors
                                    .grey, // Border color for unselected containers
                            width: 0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: selectedContainerIndex == e["id"]
                              ? const Color.fromARGB(232, 244, 67, 54)
                              : Colors.transparent,
                          child: selectedContainerIndex == e["id"]
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            e["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            e["dateTime"],
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      recentTaskAvatar(left: 0, img: e['img1']),
                      recentTaskAvatar(left: 10, img: e['img2']),
                      if (e['id'] == 0)
                        recentTaskAvatar(left: 18, img: e['img3']),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Positioned recentTaskAvatar({
    double left = 0,
    String img = "",
  }) {
    return Positioned(
      left: left,
      top: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: CircleAvatar(
          radius: 10,
          backgroundImage: AssetImage(img),
        ),
      ),
    );
  }

  SizedBox projectRow() {
    return SizedBox(
      height: 220,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Consumer<AuthViewModel>(
              builder: (context, authViewModel, child) {
                final schools = authViewModel.allSchool;
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: schools.length,
                    itemBuilder: (BuildContext context, int index) {
                      final school = schools[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8, right: 8),
                        child: Row(
                          children: [
                            projectCard(school),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column searchBar() {
    return Column(
      children: [
        Container(
          width: 390,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Consumer<AuthViewModel>(
            builder: (context, authViewModel, child) {
              return TextFormField(
                controller: _searchController,
                onChanged: (value) {
                  authViewModel.getSearchItem(value);
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Find your task or project here...',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 15),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // Clear the search query
                        authViewModel.closeSearch();
                        _searchController.clear();
                        authViewModel.getSchools();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 20,
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }

  Row homeHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Hey, Naufal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '7 tasks today!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/profile.jpg',
          ),
        ),
      ],
    );
  }

  Row seeAllWidget(
      {String title = "", String text = "See All", Function()? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const Icon(
              (Icons.arrow_forward_ios_sharp),
              color: Colors.orange,
              size: 13,
            ),
          ],
        ),
      ],
    );
  }

  Padding projectCard(SchoolModel school) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Container(
            height: 135,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(73, 140, 214, 248),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.laptop,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        school.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        school.domainString,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: 180,
            padding: const EdgeInsets.only(top: 10, left: 5, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            circleAvatar(
                                top: 0, left: 5, img: "assets/profile.jpg"),
                            circleAvatar(
                                top: 0, left: 18, img: "assets/profile2.jpg"),
                            circleAvatar(
                                top: 0, left: 30, img: "assets/profile3.jpg"),
                            circleAvatar(
                                top: 2, left: 40, img: "assets/profile3.jpg"),
                            circleAvatarText(),
                          ],
                        ),
                      ),
                      const Text(
                        '50%',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          bottom: 10,
                        ),
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                          bottom: 10,
                        ),
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned circleAvatarText() {
    return const Positioned(
      top: 2,
      left: 40,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: Color.fromARGB(220, 177, 183, 191),
        child: Text(
          '+2',
          style: TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  circleAvatar({
    double top = 0,
    double left = 0,
    String img = "",
    double radius = 10,
    bool isImag = true,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(img),
      ),
    );
  }

  Widget buildContainer(
    int index,
    String title,
    String subtitle,
    List<String> avatarImages,
  ) {
    bool isSelected = selectedContainerIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
      child: Container(
        width: 370,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: const Offset(0, 10),
              ),
            if (!isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            if (!isSelected)
              if (isSelected)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 6,
                  blurRadius: 4,
                  offset: const Offset(-10, -10),
                ),
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: const Offset(10, -10),
              ),
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: const Offset(-10, 10),
              ),
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: const Offset(10, 10),
              ),
          ],
          border: isSelected
              ? null
              : Border.all(
                  color: Colors.grey,
                  width: 0,
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : Colors.grey, // Border color for unselected containers
                    width: 0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: selectedContainerIndex == index
                      ? const Color.fromARGB(232, 244, 67, 54)
                      : Colors.transparent,
                  child: selectedContainerIndex == index
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 100),
                child: Stack(
                  children: [
                    for (var i = 0; i < avatarImages.length; i++)
                      Positioned(
                        top: 0,
                        left: i * 10,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(avatarImages[i]),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
