import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Container(
        height: 500,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search Screen Content'),
            Icon(Icons.abc),
          ],
        ),
      ),
    );
  }
}


// suffixIcon: Icon(
                          //       Icons.check,
                          //       color: Colors.grey,
                          //       size: 30,
                          //     ),
                          //     child: Text(
                          //       'ADJ3AK',
                          //       style: GoogleFonts.roboto(
                          //         textStyle: const TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 15,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Promocode applied',
                          //       style: GoogleFonts.roboto(
                          //         textStyle: const TextStyle(
                          //           color: Colors.green,
                          //           fontSize: 15,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //     const Padding(
                          //       padding: EdgeInsets.symmetric(horizontal: 10),
                          //       child: CircleAvatar(
                          //         radius: 10,
                          //         backgroundColor: Colors.green,
                          //         child: Icon(
                          //           Icons.check,
                          //           color: Colors.white,
                          //           size: 20,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),