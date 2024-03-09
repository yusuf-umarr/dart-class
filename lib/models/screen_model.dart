import 'package:flutter/material.dart';
import 'package:personal_files/constant/color.dart';

class ScreenModel extends ChangeNotifier {
  final List _content = [
    {
      'color': AppColor.cardOne,
      'title': 'Pictures',
      'subtitle': '480 files',
      'icon': Icons.camera,
      'iconColor': AppColor.cardOne,
      'iconSize': 3,
    },
    {
      'color': AppColor.cardTwo,
      'title': 'Documents',
      'subtitle': '190 files',
      'icon': Icons.file_copy,
      'iconColor': AppColor.cardTwo,
      'iconSize': 3,
    },
    {
      'color': AppColor.cardThree,
      'title': 'Vidoes',
      'subtitle': '30 files',
      'icon': Icons.videocam_rounded,
      'iconColor': AppColor.cardThree,
      'iconSize': 3,
    },
    {
      'color': AppColor.cardFour,
      'title': 'Audio',
      'subtitle': '80 files',
      'icon': Icons.mic,
      'iconColor': AppColor.cardFour,
      'iconSize': 3,
    }
  ];
  get content => _content;
}
