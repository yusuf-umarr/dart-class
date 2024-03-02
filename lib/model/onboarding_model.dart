import 'package:flutter/material.dart';

class OnBoardingModel extends ChangeNotifier {
  final List<Map<String, dynamic>> contents = [
    {
      "image": 'assets/delivery.svg',
      "title": 'Navigate Logistics, \nSimplify Success',
      "description":
          'Empowering businesses through smart logistics - your path to efficient supply chain management.',
    },
    {
      "image": 'assets/order.svg',
      "title": 'Seamless Delivery Management',
      "description":
          'Manage your delivery schedules, routes, and drivers efficiently for on-time deliveries.',
    },

    {
      "image": 'assets/logistics.svg',
      "title": 'Easy Shipment Management',
      "description":
          'Effortlessly create, track, and manage your shipments from pickup to delivery.',
    }

    // {
    //   'image': 'assets/start.svg',
    //    "title": 'Get Started!',
    //    "description": 'Your jounney begins here!',
    // },
  ];
}
