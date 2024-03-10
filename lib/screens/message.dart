import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  int selectedTab = 0;
  int selectedContainerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey, Naufal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '7 tasks today!',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/profile.jpg',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          buildContainer(
            0,
            'Landing Page Design',
            'Today, 10:31 AM',
            [
              'assets/profile.jpg',
              'assets/profile2.jpg',
              'assets/profile3.jpg',
            ],
          ),
          const SizedBox(height: 10),
          buildContainer(
            1,
            'Improvement Color',
            '31 March 2023, 02:42 PM',
            [
              'assets/profile.jpg',
              'assets/profile2.jpg',
            ],
          ),
          const SizedBox(height: 10),
          buildContainer(
            2,
            'Home Banking Mobile App',
            '1 April 2023, 09:29 AM',
            [
              'assets/profile.jpg',
              'assets/profile2.jpg',
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContainer(
    int index,
    String title,
    String subtitle,
    List<String> avatarImages,
  ) {
    bool isSelected = selectedContainerIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
      child: Container(
        width: 370,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: const Offset(0, 10),
              ),
            if (!isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            if (!isSelected)
              if (isSelected)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 6,
                  blurRadius: 4,
                  offset: const Offset(-10, -10),
                ),
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: const Offset(10, -10),
              ),
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: const Offset(-10, 10),
              ),
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: const Offset(10, 10),
              ),
          ],
          border: isSelected
              ? null
              : Border.all(
                  color: Colors.grey,
                  width: 0,
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : Colors.grey, // Border color for unselected containers
                    width: 0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: selectedContainerIndex == index
                      ? const Color.fromARGB(232, 244, 67, 54)
                      : Colors.transparent,
                  child: selectedContainerIndex == index
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 100),
                child: Stack(
                  children: [
                    for (var i = 0; i < avatarImages.length; i++)
                      Positioned(
                        top: 0,
                        left: i * 13.0,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(avatarImages[i]),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
