import 'dart:developer';

import 'package:clients_list/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sales extends StatefulWidget {
  Sales({Key? key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  List<Map<String, dynamic>> averageSales = [];

  setChartOne() {
    final width = MediaQuery.of(context).size.width * 0.8;

    averageSales = [
      {
        "day": "Saturday",
        "width": width - 10,
        "colors": AppColor.saturdayColor
      },
      {"day": "Sunday", "width": width - 20, "colors": AppColor.sundayColor},
      {"day": "Monday", "width": width - 30, "colors": AppColor.mondayColor},
      {"day": "Tuesday", "width": width - 40, "colors": AppColor.tuesdayColor},
      {
        "day": "Wednesday",
        "width": width - 50,
        "colors": AppColor.wednesdayColor
      },
      {"day": "Thurday", "width": width - 60, "colors": AppColor.thursdayColor},
      {"day": "Friday", "width": width - 70, "colors": AppColor.fridayColor},
    ];
    setState(() {});
  }

  setChartTow() {
    final width = MediaQuery.of(context).size.width * 0.8;

    averageSales = [
      {"day": "monday", "width": width - 30, "colors": AppColor.saturdayColor},
      {"day": "Sunday", "width": width - 20, "colors": AppColor.sundayColor},
      {"day": "Monday", "width": width - 10, "colors": AppColor.mondayColor},
      {"day": "Tuesday", "width": width - 40, "colors": AppColor.tuesdayColor},
      {
        "day": "Wednesday",
        "width": width - 200,
        "colors": AppColor.wednesdayColor
      },
      {"day": "Thurday", "width": width - 60, "colors": AppColor.thursdayColor},
      {"day": "Friday", "width": width - 30, "colors": AppColor.fridayColor},
    ];
    setState(() {});
  }

  setChartTHree() {
    log("setChartTHree called");
    final width = MediaQuery.of(context).size.width * 0.8;

    averageSales = [
      {
        "day": "Saturday",
        "width": width - 10,
        "colors": AppColor.saturdayColor
      },
      {"day": "Sunday", "width": width - 40, "colors": AppColor.sundayColor},
      {"day": "Monday", "width": width - 10, "colors": AppColor.mondayColor},
      {"day": "Tuesday", "width": width - 50, "colors": AppColor.tuesdayColor},
      {
        "day": "Wednesday",
        "width": width - 200,
        "colors": AppColor.wednesdayColor
      },
      {"day": "Thurday", "width": width - 20, "colors": AppColor.thursdayColor},
      {"day": "Friday", "width": width - 30, "colors": AppColor.fridayColor},
    ];
    setState(() {});

    log("setChartTHree called end");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Average sales per day',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Last 7 Days Chart',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.red, fontSize: 10)),
                  Text(
                    '7 Days',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: averageSales.length,
                    itemBuilder: (context, int index) {
                      final day = averageSales[index];

                      return GestureDetector(
                        onTap: () {
                          log("index: $index");
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: day['width'],
                              decoration: BoxDecoration(
                                borderRadius: index == 0
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                      )
                                    : const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                      ),
                                color: day['colors'],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 10,
                                ),
                                child: Text(
                                  day['day'],
                                  style: const TextStyle(
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              const SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: () {
                  setChartOne();
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: const Text("get chart data 1")),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setChartTow();
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: const Text("get chart data 2")),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setChartTHree();
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: const Text("get chart data3")),
              )

              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         height: 40,
              //         width: double.infinity,
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(10),
              //             topRight: Radius.circular(10),
              //           ),
              //           color: AppColor.saturdayColor,
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.only(
              //             left: 20,
              //             top: 10,
              //           ),
              //           child: Text(
              //             'Saturday',
              //             style: TextStyle(
              //               color: AppColor.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 40,
              //         width: 350,
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             bottomRight: Radius.circular(10),
              //           ),
              //           color: AppColor.sundayColor,
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.only(
              //             left: 20,
              //             top: 10,
              //           ),
              //           child: Text(
              //             'Sunday',
              //             style: TextStyle(
              //               color: AppColor.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 40,
              //         width: 330,
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             bottomRight: Radius.circular(10),
              //           ),
              //           color: AppColor.mondayColor,
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.only(
              //             left: 18,
              //             top: 10,
              //           ),
              //           child: Text(
              //             'Monday',
              //             style: TextStyle(
              //               color: AppColor.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 40,
              //         width: 310,
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             bottomRight: Radius.circular(10),
              //           ),
              //           color: AppColor.tuesdayColor,
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.only(
              //             left: 18,
              //             top: 10,
              //           ),
              //           child: Text(
              //             'Tuesday',
              //             style: TextStyle(
              //               color: AppColor.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 40,
              //         width: 290,
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             bottomRight: Radius.circular(10),
              //           ),
              //           color: AppColor.wednesdayColor,
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.only(
              //             left: 18,
              //             top: 10,
              //           ),
              //           child: Text(
              //             'Wednesday',
              //             style: TextStyle(
              //               color: AppColor.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 40,
              //         width: 270,
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             bottomRight: Radius.circular(10),
              //           ),
              //           color: AppColor.thursdayColor,
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.only(
              //             left: 18,
              //             top: 10,
              //           ),
              //           child: Text(
              //             'Thursday',
              //             style: TextStyle(
              //               color: AppColor.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 40,
              //         width: 250,
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             bottomRight: Radius.circular(10),
              //           ),
              //           color: AppColor.fridayColor,
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.only(
              //             left: 20,
              //             top: 10,
              //           ),
              //           child: Text(
              //             'Friday',
              //             style: TextStyle(
              //               color: AppColor.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
