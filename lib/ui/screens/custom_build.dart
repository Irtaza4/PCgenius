import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pc_genius/ui/screens/ComponentScreens/processors_screen.dart';

import 'package:pc_genius/ui/screens/login_screen.dart'; // Adjust navigation to login if needed


import '../../Utils/utils.dart'; // Your custom round button widget

class CustomBuild extends StatefulWidget {
  const CustomBuild({super.key});

  @override
  State<CustomBuild> createState() => _CustomBuildState();
}

class _CustomBuildState extends State<CustomBuild> {
  final _auth = FirebaseAuth.instance;
  bool isLoadingCustomBuild = false;
  bool isLoadingAIBuild = false;
  Map<int, bool> buttonLoadingStates = {}; // Track individual button loading states

  void setButtonLoadingState(int index, bool isLoading) {
    setState(() {
      buttonLoadingStates[index] = isLoading;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'CUSTOM BUILD',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut().then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: Icon(Icons.logout_outlined, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.green],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'ADD COMPONENTS',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.green.withOpacity(0.5),
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  isLoadingCustomBuild = true;
                                });
                                await Future.delayed(Duration(seconds: 1)); // Simulate loading
                                setState(() {
                                  isLoadingCustomBuild = false;
                                });
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProcessorsScreen()));
                              },
                              child: Container(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.greenAccent.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: isLoadingCustomBuild
                                      ? CircularProgressIndicator(color: Colors.white)
                                      : Row(
                                    mainAxisSize: MainAxisSize.min, // Makes the Row wrap content
                                    children: [
                                      Icon(Icons.computer_outlined, color: Colors.white, size: 24), // Example Icon
                                      SizedBox(width: 8), // Space between icon and text
                                      Text(
                                        "PROCESSOR",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(0.5),
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  isLoadingCustomBuild = true;
                                });
                                await Future.delayed(Duration(seconds: 1)); // Simulate loading
                                setState(() {
                                  isLoadingCustomBuild = false;
                                });
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomBuild()));
                              },
                              child: Container(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.greenAccent.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: isLoadingCustomBuild
                                      ? CircularProgressIndicator(color: Colors.white)
                                      : Row(
                                    mainAxisSize: MainAxisSize.min, // Makes the Row wrap content
                                    children: [
                                      Icon(Icons.memory, color: Colors.white, size: 24), // Example Icon
                                      SizedBox(width: 8), // Space between icon and text
                                      Text(
                                        "RAM",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(0.5),
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  isLoadingCustomBuild = true;
                                });
                                await Future.delayed(Duration(seconds: 1)); // Simulate loading
                                setState(() {
                                  isLoadingCustomBuild = false;
                                });
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomBuild()));
                              },
                              child: Container(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.greenAccent.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: isLoadingCustomBuild
                                      ? CircularProgressIndicator(color: Colors.white)
                                      : Row(
                                    mainAxisSize: MainAxisSize.min, // Makes the Row wrap content
                                    children: [
                                      Icon(Icons.developer_board_sharp, color: Colors.white, size: 24), // Example Icon

                                      Text(
                                        "MOTHERBOARD",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(0.5),
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30,),
                    Flexible(
                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  isLoadingCustomBuild = true;
                                });
                                await Future.delayed(Duration(seconds: 1)); // Simulate loading
                                setState(() {
                                  isLoadingCustomBuild = false;
                                });
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomBuild()));
                              },
                              child: Container(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.greenAccent.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: isLoadingCustomBuild
                                      ? CircularProgressIndicator(color: Colors.white)
                                      : Row(
                                    mainAxisSize: MainAxisSize.min, // Makes the Row wrap content
                                    children: [
                                      Icon(Icons.video_label, color: Colors.white, size: 24), // Example Icon
                                      SizedBox(width: 8), // Space between icon and text
                                      Text(
                                        "GPU",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(0.5),
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  isLoadingCustomBuild = true;
                                });
                                await Future.delayed(Duration(seconds: 1)); // Simulate loading
                                setState(() {
                                  isLoadingCustomBuild = false;
                                });
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomBuild()));
                              },
                              child: Container(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.greenAccent.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: isLoadingCustomBuild
                                      ? CircularProgressIndicator(color: Colors.white)
                                      : Row(
                                    mainAxisSize: MainAxisSize.min, // Makes the Row wrap content
                                    children: [
                                      Icon(Icons.power, color: Colors.white, size: 24), // Example Icon

                                      Text(
                                        "POWER SUPPLY",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(0.5),
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  isLoadingCustomBuild = true;
                                });
                                await Future.delayed(Duration(seconds: 1)); // Simulate loading
                                setState(() {
                                  isLoadingCustomBuild = false;
                                });
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomBuild()));
                              },
                              child: Container(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.greenAccent.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: isLoadingCustomBuild
                                      ? CircularProgressIndicator(color: Colors.white)
                                      : Row(
                                    mainAxisSize: MainAxisSize.min, // Makes the Row wrap content
                                    children: [
                                      Icon(Icons.tv, color: Colors.white, size: 24), // Example Icon
                                      SizedBox(width: 8), // Space between icon and text
                                      Text(
                                        "PC CASE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(0.5),
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
