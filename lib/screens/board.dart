import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_update/screens/home.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int selectedContainerIndex = 0;

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
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            homeHeader(),
            dueDate(),
            statusView(),
            const SizedBox(
              height: 2,
            ),
            assignView(),
            descriptionHeader(),
            descriptionText(),
            taskWidget(title: 'Task'),
            showRecentTask(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: 3,
            //   ),
            //   child: buildContainer(
            //     0,
            //     'Landing Page Design',
            //     'Today, 10:31 AM',
            //     [
            //       'assets/profile.jpg',
            //       'assets/profile2.jpg',
            //       'assets/profile3.jpg',
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 5),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     // top: 2,
            //     bottom: 2,
            //   ),
            //   child: buildContainer(
            //     1,
            //     'Improvement Color',
            //     '31 March 2023, 02:42 PM',
            //     [
            //       'assets/profile4.png',
            //       'assets/profile5.jpg',
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 5),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     // top: 5,
            //     bottom: 5,
            //   ),
            //   child: buildContainer(
            //     2,
            //     'Home Banking Mobile App',
            //     '1 April 2023, 09:29 AM',
            //     [
            //       'assets/profile.jpg',
            //       'assets/profile6.png',
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
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

  Row taskWidget({String title = ''}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Text descriptionText() {
    return const Text(
      'Revamp the landing page with a modern layout, clear messaging, and user-friendly navigation to improve user engagement and conversions.',
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }

  Row descriptionHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row assignView() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Text(
            'Assign',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Naufal')
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage('assets/profile3.jpg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 9),
                    child: Text('Hanif'),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/profile2.jpg'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Ramadhan'),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row statusView() {
    return Row(
      children: [
        const Text(
          'Status',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Container(
          width: 120,
          height: 35,
          decoration: BoxDecoration(
            color: const Color.fromARGB(186, 255, 153, 0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              'On Progress',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row dueDate() {
    return const Row(
      children: [
        Text(
          'Due Date',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          'Sunday, 23 April 2023',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Row homeHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Redesign Landing Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Redesign Landing Page',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
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
                padding: const EdgeInsets.only(top: 20, left: 80),
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
