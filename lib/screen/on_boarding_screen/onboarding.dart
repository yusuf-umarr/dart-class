import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carry_go/constant/color.dart';
import 'package:carry_go/model/onboarding_model.dart';
import 'package:carry_go/screen/started.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;
  bool onLastPage = false;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Consumer<OnBoardingModel>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: value.contents.length,
                        onPageChanged: (int index) {
                          setState(() {
                            currentIndex = index;
                            onLastPage = (index == 2);
                          });
                        },
                        itemBuilder: (context, index) {
                          final content = value.contents[index];
                          return Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  content['image'],
                                  height: 250,
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    content['title'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    content['description'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Consumer<OnBoardingModel>(
                      builder: (context, value, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            value.contents.length,
                            (index) => buildDot(index, context),
                          ),
                        );
                      },
                    ),
                    onLastPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Started(),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(40),
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              if (currentIndex <
                                  Provider.of<OnBoardingModel>(context,
                                              listen: false)
                                          .contents
                                          .length -
                                      1) {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.bounceIn,
                                );
                              }
                            },
                            child: Container(
                              height: 55,
                              margin: const EdgeInsets.all(40),
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.primaryColor,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!onLastPage)
                    GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(
                            Provider.of<OnBoardingModel>(context, listen: false)
                                    .contents
                                    .length -
                                1);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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

  Container buildDot(int index, BuildContext context) {
    Color dotColor =
        currentIndex == index ? AppColors.primaryColor : AppColors.greyColor;
    return Container(
      height: 4,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: dotColor,
      ),
    );
  }
}
