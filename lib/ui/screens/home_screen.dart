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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/23.png',
                  width: 300,
                  height: 250,
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'BUILD YOUR DREAM PC',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
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
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child:const Text(
                    'Custom build the perfect setup or let our AI assistant guide you.',
                    style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.w400),
                  ),
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
                    await Future.delayed(Duration(seconds: 1)).then((value){
                      Utilas().toastMessage('Add all Components!');
                    });// Simulate loading
                    setState(() {
                      isLoadingCustomBuild = false;
                    });
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => CustomBuild(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0); // Start from the right side
                          const end = Offset.zero;        // End at the center
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );


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
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => AiPcBuilder(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0); // Start from the right side
                          const end = Offset.zero;        // End at the center
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
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
