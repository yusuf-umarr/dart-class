import 'package:carry_go/constant/color.dart';
import 'package:flutter/material.dart';

class ScreenModel extends ChangeNotifier {
  final List<Map<String, dynamic>> images = [
    {
      'id': 0,
      'image': 'assets/delivery1.webp',
    },
    {
      'id': 1,
      'image': 'assets/delivery6.png',
    },
    {
      'id': 2,
      'image': 'assets/delivery3.jpg',
    },
    {
      'id': 3,
      'image': 'assets/delivery4.jpg',
    },
    {
      'id': 4,
      'image': 'assets/delivery5.png',
    },
  ];

  final List _content = [
    {
      'title': 'All Requests',
      'number': '1000',
      'task': 'Created',
      'color': AppColors.cardOne,
      'iconData': Icons.view_headline,
      'iconColor': AppColors.green,
      'iconSize': 3,
    },
    {
      'title': 'Completed Requests',
      'number': '500',
      'task': 'Completed',
      'color': AppColors.cardTwo,
      'iconData': Icons.pedal_bike,
      'iconColor': AppColors.dark,
      'iconSize': 3,
    },
    {
      'title': 'Scheduled Requests',
      'number': '10',
      'task': 'Scheduled',
      'color': AppColors.cardThree,
      'iconData': Icons.location_on,
      'iconColor': AppColors.dark,
      'iconSize': 3,
    },
    {
      'title': 'Active Requests',
      'number': '0',
      'task': 'Requests',
      'color': AppColors.cardFour,
      'iconData': Icons.check_circle,
      'iconColor': AppColors.green,
      'iconSize': 3,
    },
  ];

  get content => _content;
}
