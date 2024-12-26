import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class MotherboardsScreen extends StatefulWidget {
  const MotherboardsScreen({super.key, Map<String, String>? selectedMotherBoard});

  @override
  State<MotherboardsScreen> createState() => _MotherboardsScreenState();
}

class _MotherboardsScreenState extends State<MotherboardsScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('motherboards'); // Reference to the 'motherboards' node in Firebase
  String? selectedMotherboardId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Setting the scaffold background color to black
      appBar: AppBar(
        title: Text(
          'MOTHERBOARDS VARIANTS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
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
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              defaultChild: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                  strokeWidth: 4.0,
                ),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                // Fetching the motherboard data from Firebase
                String motherboardId = snapshot.key ?? '';
                String imageUrl = snapshot.child('image').value.toString();
                String name = snapshot.child('name').value.toString();
                String slots = snapshot.child('slots').value.toString();
                String price = snapshot.child('price').value.toString();
                String socket = snapshot.child('socket').value.toString();
                String maxMemory = snapshot.child('maxMemory').value.toString();
                String formFactor = snapshot.child('formFactor').value.toString();
                String color = snapshot.child('color').value.toString();

                bool isSelected = motherboardId == selectedMotherboardId;

                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      leading: Container(
                        width: 60,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent, width: 2),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.5),
                              blurRadius: 2,
                              offset: Offset(2, 4),
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('Slots: ', slots),
                          SizedBox(height: 5),
                          _buildInfoRow('Socket: ', socket),
                          SizedBox(height: 5),
                          _buildInfoRow('Max Memory: ', maxMemory),
                          SizedBox(height: 5),
                          _buildInfoRow('Form Factor: ', formFactor),
                          SizedBox(height: 5),
                          _buildInfoRow('Color: ', color),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Price: ',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  '$price ',
                                  style: TextStyle(color: Colors.green),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedMotherboardId = motherboardId;
                          });
                          Navigator.pop(context, {
                            'image': imageUrl,
                            'name': name,
                            'price': price,
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected ? Colors.black : Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isSelected ? 'Added' : 'Add',
                          style: TextStyle(color: isSelected ? Colors.green : Colors.white),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, thickness: 1),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create information rows
  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            value,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}