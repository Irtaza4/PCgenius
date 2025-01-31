import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pc_genius/ui/screens/build_result_screen.dart';
import 'package:pc_genius/ui/screens/login_screen.dart';
import '../../Utils/utils.dart'; // Your custom round button widget

class AiPcBuilder extends StatefulWidget {
  const AiPcBuilder({super.key});

  @override
  State<AiPcBuilder> createState() => _AiPcBuilderState();
}

class _AiPcBuilderState extends State<AiPcBuilder> {
  final _auth = FirebaseAuth.instance;
  String? selectedBudget; // Initially set to null for placeholder
  String? selectedPcType; // Initially set to null for placeholder
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    // Ensure that initial values are null for both fields
  }

  void handleShowBuild() {
    if (selectedBudget == null || selectedPcType == null) {
      setState(() {
        errorMessage = 'Please select both budget and PC type.';
      });
      return;
    }

    // Navigate to BuildResultsScreen with selected options
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => BuildResultsScreen(
          budget: selectedBudget!,
          pcType: selectedPcType!,
        ),
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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'EASY BUILD',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: const Icon(Icons.logout_outlined, color: Colors.white),
          ),
          const SizedBox(width: 10),
        ],
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.green],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Image.asset(
                    'assets/images/1.jpeg',
                    width: 250,
                    height: 150,
                  ),
                ),
              ),
                const SizedBox(height: 20,),
              Center(
                child: Text(
                  'Crafting Your Digital Dreams, One Byte at a Time',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.green.withOpacity(0.5),
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Budget Input Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "How much money you want to spend on your Build?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: selectedBudget, // Default value set to null
                    hint: Text(
                      'Select Your Budget',
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF2F4F2F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(color: Color(0xFF88C388)),
                      ),
                    ),
                    dropdownColor: const Color(0xFF2F4F2F),
                    style: const TextStyle(color: Colors.white),
                    items: const [
                      DropdownMenuItem(value: "50000", child: Text("50,000 - 70,000")),
                      DropdownMenuItem(value: "70000", child: Text("70,000 - 90,000")),
                      DropdownMenuItem(value: "90000", child: Text("90,000 - 110,000")),
                      DropdownMenuItem(value: "110000", child: Text("110,000 - 130,000")),
                      DropdownMenuItem(value: "130000", child: Text("130,000 - 150,000")),
                      DropdownMenuItem(value: "150000", child: Text("150,000 - 170,000")),
                      DropdownMenuItem(value: "170000", child: Text("170,000 - 190,000")),
                      DropdownMenuItem(value: "190000", child: Text("190,000 - 210,000")),
                      DropdownMenuItem(value: "250000", child: Text("250,000 - 270,000")),
                      DropdownMenuItem(value: "500000", child: Text("490,000 - 500,000")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedBudget = value;
                        errorMessage = null;
                      });
                    },
                  ),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        errorMessage!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),

              // PC Type Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What type of PC you want?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: selectedPcType, // Default value set to null
                    hint: Text(
                      'Select Your PC Type',
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF2F4F2F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(color: Color(0xFF88C388),
                        ),
                      ),
                    ),
                    dropdownColor: const Color(0xFF2F4F2F),
                    style: const TextStyle(color: Colors.white),
                    items: const [
                      DropdownMenuItem(value: "Gaming", child: Text("Gaming")),
                      DropdownMenuItem(value: "Graphic Designing", child: Text("Graphic Designing")),
                      DropdownMenuItem(value: "Office Work", child: Text("Office Work")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedPcType = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Button to show build
              ElevatedButton(
                onPressed: handleShowBuild,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 10, // This adds shadow to the button itself
                ),
                child: Text(
                  "Show My Build",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.6), // Green accent shadow
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
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
