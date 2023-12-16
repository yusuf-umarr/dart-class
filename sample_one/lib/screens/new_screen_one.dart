import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreenOne extends StatelessWidget {
   NewScreenOne({super.key});

  List<int> ourNumber = [1,2,3,4,5,6,7,8,9,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen One"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, //(horizontal direction)
            mainAxisAlignment: MainAxisAlignment.center, //(vertical direction)
            children: [
              Text("First Child"),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 300,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center, //(vertical)
                  // mainAxisAlignment: MainAxisAlignment.center, //(horizontal)

                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.green,
                      ),
                    ),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // const Icon(Icons.star, color: Colors.black),
                    // const Icon(Icons.star, color: Colors.black),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // const Icon(Icons.star, color: Colors.black),
                    // const Icon(Icons.star, color: Colors.black),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // const Icon(Icons.star, color: Colors.black),
                    // const Icon(Icons.star, color: Colors.black),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // const Icon(Icons.star, color: Colors.black),
                    // const Icon(Icons.star, color: Colors.black),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // const Icon(Icons.star, color: Colors.black),
                    // const Icon(Icons.star, color: Colors.black),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.green[500]),
                  const Icon(Icons.star, color: Colors.black),
                  const Icon(Icons.star, color: Colors.black),
                ],
              ),
              CircularProgressIndicator(),
              CupertinoActivityIndicator(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // height: 100,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(right: 20),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        border: Border.all(color: Colors.black, width: 5)),
                    child: Text("Sample container"),
                  ),
                  Container(
                    // height: 100,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: Colors.red,
                    ),
                    child: Text("Sample container"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, //total item row
                      mainAxisExtent: 5,
                      crossAxisSpacing: 4),
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.red,
                      ),
                      // child: Text("Sample container"),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.red,
                      ),
                      // child: Text("Sample container"),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.red,
                      ),
                      // child: Text("Sample container"),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.red,
                      ),
                      // child: Text("Sample container"),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.red,
                      ),
                      // child: Text("Sample container"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
