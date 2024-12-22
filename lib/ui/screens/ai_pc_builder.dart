import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pc_genius/ui/screens/build_result_screen.dart';
import 'package:pc_genius/ui/screens/login_screen.dart';
import '../../Utils/utils.dart'; // Your custom round button widget
//import 'build_results_screen.dart'; // Import the BuildResultsScreen

class AiPcBuilder extends StatefulWidget {
  const AiPcBuilder({super.key});

  @override
  State<AiPcBuilder> createState() => _AiPcBuilderState();
}

class _AiPcBuilderState extends State<AiPcBuilder> {
  final _auth = FirebaseAuth.instance;
  String? selectedBudget;
  String selectedPcType = 'Gaming';
  String? errorMessage;

  void handleShowBuild() {
    if (selectedBudget == null || int.parse(selectedBudget!) < 50000 || int.parse(selectedBudget!) > 500000) {
      setState(() {
        errorMessage = 'Please enter a valid budget (50,000 - 500,000).';
      });
      return;
    }

    // Navigate to BuildResultsScreen with selected options
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuildResultsScreen(
          budget: selectedBudget!,
          pcType: selectedPcType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Ai Pc Builder',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
              Image.asset(
                'assets/images/1.jpeg',
                width: 350,
                height: 300,
              ),
              Center(
                child: Text(
                  'Crafting Your Digital Dreams, One Byte at a Time',
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
                    value: selectedBudget,
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
                    items: [
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
                        selectedBudget = value!;
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
                    value: selectedPcType,
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
                    items: [
                      DropdownMenuItem(value: "Gaming", child: Text("Gaming")),
                      DropdownMenuItem(value: "Graphic Designing", child: Text("Graphic Designing")),
                      DropdownMenuItem(value: "Office Work", child: Text("Office Work")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedPcType = value!;
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
               backgroundColor: Colors.green.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                ),
                child: const Text(
                  "Show Me My Build",
                  style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
