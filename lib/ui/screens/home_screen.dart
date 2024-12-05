import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){
            _auth.signOut().then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }).onError((error,stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon: Icon(Icons.logout_outlined,color: Colors.white,)),
          SizedBox(width: 10,)
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
                  colors: [Colors.black, Colors.green])),
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
                        color: Colors.green.withOpacity(0.5), // Shadow color with opacity
                        offset: Offset(3.0, 3.0), // Shadow position (horizontal, vertical)
                        blurRadius: 5.0, // Shadow blur radius
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text('Custom build the perfect setup or let our AI assistant guide you.',
                  style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: (){
              
                },
                child: Container(
                  height: 70,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),  // Shadow color
                        spreadRadius: 3,  // Spread of shadow
                        blurRadius: 5,    // Blur of shadow
                        offset: Offset(0, 3),  // Offset of shadow (vertical and horizontal)
                      ),
                    ],
              
              
                  ),
                child: Center(child: Text('CUSTOM BUILD',style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w800,fontSize:20,
                     shadows: [
                    Shadow(
                    color: Colors.black.withOpacity(0.5),  // Shadow color
                  offset: Offset(2.0, 2.0),  // Offset (horizontal, vertical)
                  blurRadius: 5.0,  // Blur radius for soft edges
                ),
                  ],),)),
                ),
              ),
              SizedBox(height: 30,),
              InkWell(

                onTap:  (){
              
                },
                child: Container(
                  height: 70,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.withOpacity(0.3),  // Shadow color
                        spreadRadius: 3,  // Spread of shadow
                        blurRadius: 5,    // Blur of shadow
                        offset: Offset(0, 3),  // Offset of shadow (vertical and horizontal)
                      ),
                    ],
              
              
                  ),
                  child: Center(child: Text('AI PC BUILDER',style: TextStyle(color: Colors.greenAccent,
                    fontWeight: FontWeight.w800,fontSize:20,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),  // Shadow color
                        offset: Offset(2.0, 2.0),  // Offset (horizontal, vertical)
                        blurRadius: 5.0,  // Blur radius for soft edges
                      ),
                    ],),)),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}


// GridView.builder(
// shrinkWrap: true,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// crossAxisSpacing: 20.0,
// mainAxisSpacing: 20.0,
// childAspectRatio: 1.2,
// ),
// itemCount: 4,
// itemBuilder: (context, index) {
// return InkWell(
// onTap: () {
// // Add navigation based on the button
// if (index == 0) {
// Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
// } else if (index == 1) {
// Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
// }
// },
// child: Container(
// decoration: BoxDecoration(
// color: Colors.green,
// borderRadius: BorderRadius.circular(10),
// ),
// child: Center(
// child: Icon(
// Icons.computer,
// size: 50,
// color: Colors.white,
// ),
// ),
// ),
// );
// },
// ),
// SizedBox(height: 30),
// RoundButton(
// title: 'Explore More',
// onTap: () {
// // Action when "Explore More" is tapped
// },
// )

