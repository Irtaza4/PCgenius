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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 15,),
            Center(
              child: Text(
                'ADD COMPONENTS',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
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
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute space evenly between the columns
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27,vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Align the buttons at the top
                      crossAxisAlignment: CrossAxisAlignment.center, // Center the buttons horizontally
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setButtonLoadingState(0, true); // Set loading state for button 0
                              await Future.delayed(Duration(seconds: 1)); // Simulate loading
                              setButtonLoadingState(0, false); // Reset loading state
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessorsScreen()));
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity, // Use full width of the parent
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
                                child: buttonLoadingStates[0] == true
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.computer_outlined, color: Colors.white, size: 24),
                                    SizedBox(width: 4),
                                    Text(
                                      "PROCESSOR",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 11,
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
                        SizedBox(height: 20),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setButtonLoadingState(1, true); // Set loading state for button 1
                              await Future.delayed(Duration(seconds: 1)); // Simulate loading
                              setButtonLoadingState(1, false); // Reset loading state
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBuild()));
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity, // Use full width of the parent
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
                                child: buttonLoadingStates[1] == true
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.memory, color: Colors.white, size: 24),
                                    SizedBox(width: 8),
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
                        SizedBox(height: 20),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setButtonLoadingState(2, true); // Set loading state for button 2
                              await Future.delayed(Duration(seconds: 1)); // Simulate loading
                              setButtonLoadingState(2, false); // Reset loading state
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBuild()));
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity, // Use full width of the parent
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
                                child: buttonLoadingStates[2] == true
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.developer_board_sharp, color: Colors.white, size: 24),
                                    SizedBox(width: 3),
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
                ),
                //SizedBox(width: 5), // Add space between the two columns
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Align the buttons at the top
                      crossAxisAlignment: CrossAxisAlignment.center, // Center the buttons horizontally
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setButtonLoadingState(3, true); // Set loading state for button 3
                              await Future.delayed(Duration(seconds: 1)); // Simulate loading
                              setButtonLoadingState(3, false); // Reset loading state
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBuild()));
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity, // Use full width of the parent
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
                                child: buttonLoadingStates[3] == true
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.video_label, color: Colors.white, size: 24),
                                    SizedBox(width: 8),
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
                        SizedBox(height: 20),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setButtonLoadingState(4, true); // Set loading state for button 4
                              await Future.delayed(Duration(seconds: 1)); // Simulate loading
                              setButtonLoadingState(4, false); // Reset loading state
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBuild()));
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity, // Use full width of the parent
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
                                child: buttonLoadingStates[4] == true
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.power, color: Colors.white, size: 24),
                                    SizedBox(width: 8),
                                    Text(
                                      "POWER\nSUPPLY",
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
                        SizedBox(height: 20),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setButtonLoadingState(5, true); // Set loading state for button 5
                              await Future.delayed(Duration(seconds: 1)); // Simulate loading
                              setButtonLoadingState(5, false); // Reset loading state
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBuild()));
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity, // Use full width of the parent
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
                                child: buttonLoadingStates[5] == true
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.tv, color: Colors.white, size: 24),
                                    SizedBox(width: 8),
                                    Text(
                                      "CASES",
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
