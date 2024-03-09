import 'package:flutter/material.dart';
import 'package:personal_files/constant/color.dart';
import 'package:personal_files/core/utils/util.dart';

class RecentFileClass extends StatelessWidget {
  const RecentFileClass({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
        children: recentFileData.map((e) {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: e['color'],
                    ),
                    child: Center(
                      child: Icon(
                        e['icon'],
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Center(
                    child: Text(
                      e['fileName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width <= 900 ? 11 : 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Center(
                child: Text(
                  e['fileType'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width <= 900 ? 11 : 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Center(
                child: Text(
                  e['fileSize'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width <= 900 ? 11 : 15,
                  ),
                ),
              ),
              SizedBox(
                width: size.width <= 900 ? 8 : 10,
              ),
              Center(
                child: Icon(
                  Icons.share,
                  color: AppColor.cardFour,
                  size: size.width <= 900 ? 12 : 15,
                ),
              ),
              SizedBox(
                width: size.width <= 900 ? 7 : 20,
              ),
              Center(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColor.cardFour,
                  size: size.width <= 900 ? 14 : 18,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList());
  }
}
//