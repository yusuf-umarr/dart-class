import 'package:flutter/material.dart';

class PodcastDashboard extends StatefulWidget {
  const PodcastDashboard({super.key});

  @override
  State<PodcastDashboard> createState() => _PodcastDashboardState();
}

class _PodcastDashboardState extends State<PodcastDashboard> {
  List<Map<String, dynamic>> podcastList = [
    {"id": 0, "title": "All podcast"},
    {"id": 1, "title": "Design"},
    {"id": 2, "title": "Music"},
    {"id": 3, "title": "Portfolio"},
  ];

  List<Map<String, dynamic>> AllpodcastList = [
    {"id": 0, "img": "assets/profile.jpg"},
    {"id": 1, "img": "assets/profile4.png"},
    {"id": 2, "img": "assets/profile6.png"},
    {"id": 3, "img": "assets/profile2.jpg"},
    {"id": 0, "img": "assets/profile.jpg"},
    {"id": 1, "img": "assets/profile4.png"},
    {"id": 2, "img": "assets/profile6.png"},
    {"id": 3, "img": "assets/profile2.jpg"},
  ];

  int selectedIntex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            const Text(
              "Top podcats of the week",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: podcastList.length,
                  itemBuilder: (context, int index) {
                    final data = podcastList[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIntex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIntex == index
                              ? Colors.yellow
                              : Colors.grey.withOpacity(0.4),
                        ),
                        child: Center(
                            child: Text(
                          data['title'],
                          style: TextStyle(
                            color: selectedIntex == index
                                ? Colors.black
                                : Colors.grey,
                          ),
                        )),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            showPodcast()
          ],
        ),
      ),
    );
  }

  showPodcast() {
    final Size size = MediaQuery.of(context).size;
    if (selectedIntex == 0) {
      return showAllPodcast(); //dynamic image
    } else if (selectedIntex == 1) {
      return podcastType(size,
          img1: "assets/profile3.jpg", img2: "assets/profile4.png");
    } else if (selectedIntex == 2) {
      return podcastType(size,
          img1: "assets/profile5.jpg", img2: "assets/profile6.png");
    } else if (selectedIntex == 3) {
      return portfolioWidget();
    }
  }

  Column portfolioWidget() {
    return const Column(
      children: [
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Portfolio data",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  showAllPodcast() {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: AllpodcastList.map<Widget>((e) {
          return imageAvatar(size, image: e['img']);
        }).toList(),
      ),
    );
  }

  podcastType(
    Size size, {
    String img1 = "assets/profile.jpg",
    String img2 = "assets/profile2.jpg",
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          imageAvatar(size, image: img1),
          imageAvatar(size, image: img2),
          imageAvatar(size, image: img2),
          imageAvatar(size, image: img2),
        ],
      ),
    );
  }

  imageAvatar(Size size, {String image = "assets/profile.jpg"}) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          image,
          height: size.height * 0.28,
          width: size.width * 0.35,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
