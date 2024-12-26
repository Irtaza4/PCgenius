import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pc_genius/ui/screens/ai_pc_builder.dart';
import 'package:pc_genius/ui/screens/custom_build.dart';
import 'package:pc_genius/ui/screens/signup_screen.dart'; // Adjust your screen navigation here
import 'package:pc_genius/ui/screens/login_screen.dart'; // Adjust navigation to login if needed
import 'package:pc_genius/Widgets/round_button.dart';

import '../../Utils/utils.dart'; // Your custom round button widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  bool isLoadingCustomBuild = false;
  bool isLoadingAIBuild = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
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
        automaticallyImplyLeading: false,
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
              Image.asset(
                'assets/images/23.png',
                width: 350,
                height: 300,
              ),
              Center(
                child: Text(
                  'BUILD YOUR DREAM PC',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
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
              Center(
                child: Text(
                  'Custom build the perfect setup or let our AI assistant guide you.',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              SizedBox(height: 40),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomBuild()));

                  },
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: isLoadingCustomBuild
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        'CUSTOM BUILD',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      isLoadingAIBuild = true;
                    });
                    await Future.delayed(Duration(seconds: 1)); // Simulate loading
                    setState(() {
                      isLoadingAIBuild = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AiPcBuilder()),
                    );
                  },
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
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
                      child: isLoadingAIBuild
                          ? CircularProgressIndicator(color: Colors.greenAccent)
                          : Text(
                        'EASY BUILD',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
