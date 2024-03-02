import 'dart:developer';

import 'package:carry_go/constant/color.dart';
import 'package:carry_go/model/screen_model.dart';
import 'package:carry_go/screen/request_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int? accountType;

  getAccountType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      accountType = prefs.getInt("accountType");
    });

    log("accountType:$accountType");
  }

  @override
  void initState() {
    getAccountType();
    super.initState();
  }

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showTopItem(),
        Expanded(child: showBottomItem()),
      ],
    );
  }

  showTopItem() {
    return Center(
        child: Text(
      'Home',
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: AppColors.dark,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ));
  }

  showBottomItem() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            dashboardHeader(),
            const SizedBox(
              height: 30,
            ),
            dashboardPop(),
            const SizedBox(
              height: 20,
            ),
            dashboardSlider(),
            const SizedBox(
              height: 5,
            ),
            requestCardsContainer(),
            recentHeaderText(),
            const SizedBox(
              height: 20,
            ),
            recentRowCard()
          ],
        ),
      ),
    );
  }

  Container recentRowCard() {
    return Container(
      width: 350,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/pizza.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pizza-Hut',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'Today, 7:10 pm',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: AppColors.greyText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 90,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Scheduled',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    '15. 12 2023',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: AppColors.greyText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding recentHeaderText() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recent Request activity',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'See all',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primaryColor,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  requestCardsContainer() {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.3,
      child: Consumer<ScreenModel>(
        builder: (context, value, child) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // mainAxisExtent: 50,
              mainAxisSpacing: 10,
              crossAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: value.content.length,
            padding: const EdgeInsets.all(5),
            itemBuilder: (context, index) {
              final item = value.content[index];
              return RequestItemTile(
                title: item['title'],
                number: item['number'],
                task: item['task'],
                color: item['color'],
                iconData: item['iconData'],
                iconColor: item['iconColor'],
                iconSize: item['itemSize'],
              );
            },
          );
        },
      ),
    );
  }

  SizedBox dashboardSlider() {
    return SizedBox(
      height: 180,
      width: 340,
      child: Stack(
        children: [
          Consumer<ScreenModel>(
            builder: (context, imageProvider, _) {
              return PageView.builder(
                itemCount: imageProvider.images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: ((context, index) {
                  final image = imageProvider.images[index]['image'];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Consumer<ScreenModel>(
              builder: (context, imageProvider, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    imageProvider.images.length,
                    (index) => Container(
                      width: 7,
                      height: 7,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? AppColors.white
                            : AppColors.greyColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container dashboardPop() {
    return Container(
      height: 180,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.close,
                  size: 15,
                  color: AppColors.primaryColor,
                )
              ],
            ),
            Text(
              'Optimize Your Logistics Experience',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            Center(
              child: Text(
                'Complete Your Profile Settings to Seamlessly Place and Receive \n Orders.',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: AppColors.dark,
                    fontSize: 17,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: Text(
                  'Complete Settings Now',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row dashboardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/profile.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kayode Kola',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.dark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  accountType == 0
                      ? Text(
                          'kolaK@gmail.com',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyColor,
              ),
              child: const Center(
                child: Icon(Icons.add_circle),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyColor,
              ),
              child: const Center(
                child: Icon(Icons.notifications),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
