import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class PowerSuppliesScreen extends StatefulWidget {
  const PowerSuppliesScreen({super.key});

  @override
  State<PowerSuppliesScreen> createState() => _PowerSuppliesScreenState();
}

class _PowerSuppliesScreenState extends State<PowerSuppliesScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('power_supplies'); // Reference to the 'power_supplies' node in Firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Setting the scaffold background color to black
      appBar: AppBar(
        title: Text(
          'POWER SUPPLIES VARIANTS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18, // Set the desired font size here
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
              query: ref, // Firebase reference to fetch power supplies
              defaultChild: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent), // Green accent color
                  strokeWidth: 4.0, // Adjust thickness
                ),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                // Fetching the power supply data from Firebase
                String imageUrl = snapshot.child('image_url').value.toString();
                String name = snapshot.child('name').value.toString();
                String modular = snapshot.child('modular').value.toString();
                String pricePkr = snapshot.child('price_pkr').value.toString();
                String type = snapshot.child('type').value.toString();
                String color = snapshot.child('color').value.toString();
                String certification = snapshot.child('certification').value.toString();
                String wattage = snapshot.child('wattage').value.toString();

                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      leading: Container(
                        width: 60,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent, width: 2), // Green border
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.5), // Green accent shadow
                              blurRadius: 2,
                              offset: Offset(2, 4), // Shadow offset
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
                          _buildInfoRow('Modular: ', modular),
                          SizedBox(height: 5),
                          _buildInfoRow('Type: ', type),
                          SizedBox(height: 5),
                          _buildInfoRow('Color: ', color),
                          SizedBox(height: 5),
                          _buildInfoRow('Certification: ', certification),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Price: ',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  '$pricePkr \RS',
                                  style: TextStyle(color: Colors.green),
                                  overflow: TextOverflow.ellipsis, // Prevents overflow
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          _buildInfoRow('Wattage: ', wattage),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Add your action for the 'Add' button here
                          print("Added $name to the build");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey, thickness: 1), // Grey line between variants
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
            overflow: TextOverflow.ellipsis, // Prevents text overflow
          ),
        ),
      ],
    );
  }
}
