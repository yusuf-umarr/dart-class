import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:personal_files/constant/color.dart';
import 'package:personal_files/core/theme/app_theme.dart';
import 'package:personal_files/screens/widgets/recent_files.dart';
import 'package:personal_files/screens/widgets/sidebar.dart';

class DesktopBody extends StatelessWidget {
  DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    log("width :${size.width}");
    log("height :${size.height}");

    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Sizebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: 
                  Column(
                    children: [
                      searchBar(),
                      const SizedBox(
                        height: 12,
                      ),
                      categoriesText(),
                      const SizedBox(
                        height: 11,
                      ),
                      cardContainer(),
                      const SizedBox(
                        height: 10,
                      ),
                      filesText(),
                      const SizedBox(
                        height: 10,
                      ),
                      fileContainer(),
                      const SizedBox(
                        height: 10,
                      ),
                      recentFilesText(),
                      const SizedBox(
                        height: 10,
                      ),
                      RecentFileClass(),
                      //
                      if (size.width > 800)
                        const SizedBox()
                      else
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            addNewFileWidget(),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              if (size.width < 800) const SizedBox() else addNewFileWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Padding addNewFileWidget() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: 280,
        // height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            addNewFile(),
            const SizedBox(
              height: 5,
            ),
            storageContainer(),
            const SizedBox(
              height: 10,
            ),
            sharedFolderContainer(),
          ],
        ),
      ),
    );
  }


  recentFilesText() {
    return const Row(
      children: [
        Text(
          'Recent files',
          style: TextStyle(
            color: AppColor.categoryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  fileContainer() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.storage,
                        color: AppColor.cardOne,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Work',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '820 files',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 0.5,
                          color: AppColor.drawerBG,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 120,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person,
                        color: AppColor.cardTwo,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Personal',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '115 files',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 0.5,
                          color: AppColor.drawerBG,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 120,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.school,
                        color: AppColor.cardThree,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'School',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '65 files',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 0.5,
                          color: AppColor.drawerBG,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 120,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.storefront_rounded,
                        color: AppColor.cardFour,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Archive',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '21 files',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 0.5,
                          color: AppColor.drawerBG,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 120,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: AppColor.cardFour,
              ),
            ),
          ),
        ],
      ),
    );
  }

  filesText() {
    return const Row(
      children: [
        Text(
          'Files',
          style: TextStyle(
            color: AppColor.categoryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  cardContainer() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
              color: AppColor.cardOne,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 13,
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColor.cardOne,
                          size: 15,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pictures',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '480 files',
                    style: TextStyle(
                      color: Color.fromARGB(255, 198, 198, 198),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
              color: AppColor.cardTwo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 13,
                        child: Icon(
                          Icons.file_copy,
                          color: AppColor.cardTwo,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Documents',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '190 files',
                    style: TextStyle(
                      color: Color.fromARGB(255, 198, 198, 198),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
              color: AppColor.cardThree,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 13,
                        child: Icon(
                          Icons.videocam_rounded,
                          color: AppColor.cardThree,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Videos',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '30 files',
                    style: TextStyle(
                      color: Color.fromARGB(255, 198, 198, 198),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
              color: AppColor.cardFour,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 13,
                        child: Icon(
                          Icons.mic,
                          color: AppColor.cardFour,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Audio',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '80 files',
                    style: TextStyle(
                      color: Color.fromARGB(255, 198, 198, 198),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  categoriesText() {
    return const Row(
      children: [
        Text(
          'Catergories',
          style: TextStyle(
            color: AppColor.categoryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  searchBar() {
    return Column(
      children: [
        Center(
          child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color.fromARGB(186, 158, 158, 158),
                      size: 20,
                    ),
                    Text(
                      'Search',
                      style:
                          TextStyle(color: Color.fromARGB(255, 135, 179, 241)),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }

  sharedFolderContainer() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.addFileContainerBg,
        ),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your shared folders',
                      style: TextStyle(
                        color: AppColor.drawerBG,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Add any other widgets if needed
                  ],
                ),
                const SizedBox(height: 11),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.containerOne,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Keynote files',
                          style: TextStyle(
                            color: AppColor.drawerBG,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                right: 20,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/profile.webp',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/profile4.png',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 11),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.containerTwo,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vacation photos',
                          style: TextStyle(
                            color: AppColor.drawerBG,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                left: 55,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/profile4.png',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 11),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.containerThree,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Project report',
                          style: TextStyle(
                            color: AppColor.drawerBG,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                right: 20,
                                bottom: 0,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/profile.webp',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 75,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/profile4.png',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 11),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 163, 195, 239),
                    ),
                  ),
                  child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 163, 195, 239),
                          ),
                          Text(
                            'Add more',
                            style: TextStyle(
                              color: Color.fromARGB(255, 163, 195, 239),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  storageContainer() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.addFileContainerBg,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your storage',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '25% left',
                    style: TextStyle(
                      color: AppColor.cardTwo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '75 GB of 100 GB are used',
                    style: TextStyle(
                      color: AppColor.drawerBG,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 2,
                        bottom: 10,
                      ),
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColor.cardFour,
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColor.storageLeft,
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
      ),
    );
  }

  addNewFile() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
      ),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: AppColor.addFileContainerBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.file_upload,
                color: AppColor.cardFour,
                size: 40,
              ),
            ),
            Center(
              child: Text(
                'Add new files',
                style: TextStyle(
                  color: AppColor.drawerBG,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



