import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final color;
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;
  const CardTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.color,
    this.iconData,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 13,
                  child: Icon(
                    iconData,
                    color: iconColor,
                    size: iconSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
