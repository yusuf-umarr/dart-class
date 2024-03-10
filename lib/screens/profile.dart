import 'package:flutter/material.dart';
import 'package:project_update/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<AuthViewModel>().getSchools();
  }

  int selectedContainerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Column(
            children: [
              buildContainer(0),
              const SizedBox(height: 10),
              buildContainer(1),
              const SizedBox(height: 10),
              buildContainer(2),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Consumer<AuthViewModel>(
                    builder: (context, authViewModel, child) {
                      final schools = authViewModel.allSchool;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: schools.length,
                          itemBuilder: (BuildContext context, int index) {
                            final school = schools[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10, right: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              73,
                                                              140,
                                                              214,
                                                              248),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.blue
                                                              .withOpacity(0.2),
                                                          spreadRadius: 2,
                                                          blurRadius: 4,
                                                          offset: const Offset(
                                                              0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.laptop,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.more_horiz,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      school.name!,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    Text(
                                                      school.domainString,
                                                      style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Stack(
                                                        children: [
                                                          Positioned(
                                                            top: 0,
                                                            left: 5,
                                                            child: CircleAvatar(
                                                              radius: 10,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      'assets/profile.jpg'),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            left: 18,
                                                            child: CircleAvatar(
                                                              radius: 10,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      'assets/profile2.jpg'),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            left: 30,
                                                            child: CircleAvatar(
                                                              radius: 10,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      'assets/profile3.jpg'),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 2,
                                                            left: 40,
                                                            child: CircleAvatar(
                                                              radius: 8,
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          220,
                                                                          177,
                                                                          183,
                                                                          191),
                                                              child: Text(
                                                                '+2',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    child: Text(
                                                      '50%',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                      bottom: 10,
                                                    ),
                                                    child: Container(
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 2,
                                                            blurRadius: 4,
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 10,
                                                      bottom: 10,
                                                    ),
                                                    child: Container(
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 2,
                                                            blurRadius: 4,
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(int index) {
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
            if (selectedContainerIndex == index)
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 6,
                blurRadius: 12,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  index == 0
                      ? 'Landing Page Design'
                      : index == 1
                          ? 'Improvement Color'
                          : 'Home Banking Mobile App',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  index == 0
                      ? 'Today, 10:31 AM'
                      : index == 1
                          ? '31 March 2023, 02:42 PM'
                          : '1 April 2023, 09:29 AM',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    Positioned(
                      top: 0,
                      left: 18,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage('assets/profile2.jpg'),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 30,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage('assets/profile3.jpg'),
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
