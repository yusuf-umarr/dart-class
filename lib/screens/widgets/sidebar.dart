import 'package:flutter/material.dart';
import 'package:personal_files/constant/color.dart';
import 'package:personal_files/core/utils/util.dart';
import 'package:personal_files/screens/responsive/dimensions.dart';

class Sizebar extends StatelessWidget {
  final bool isMobile;
  const Sizebar({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width <= 717
          ? size.width * 0.30
          : size.width <= 760
              ? size.width * 0.25
              : size.width <= 992
                  ? size.width * 0.22
                  : size.width * 0.18,
      color: AppColor.drawerBG,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ClipOval(
                  child: Positioned(
                    top: 50,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/profile4.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: topNav.map((e) {
              return ListTile(
                leading: Icon(e['icon']),
                title: Text(
                  e['name'],
                  style: TextStyle(
                      fontSize: isMobile
                          ? 15
                          : size.width <= 522
                              ? 10
                              : size.width <= 600
                                  ? 12
                                  : 15),
                ),
                textColor: Colors.white,
                iconColor: Colors.white,
                onTap: () {
                  // Implement navigation to home
                },
              );
            }).toList(),
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: bottomNav.map((e) {
                  return ListTile(
                    leading: Icon(e['icon']),
                    title: Text(
                      e['name'],
                      style: TextStyle(
                          fontSize: isMobile
                              ? 15
                              : size.width <= 522
                                  ? 10
                                  : size.width <= 600
                                      ? 12
                                      : 15),
                    ),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {
                      // Implement navigation to settings
                    },
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
