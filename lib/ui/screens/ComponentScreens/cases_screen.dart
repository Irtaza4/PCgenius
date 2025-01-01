import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class CasesScreen extends StatefulWidget {
  const CasesScreen({super.key, Map<String, dynamic>? selectedCase});

  @override
  State<CasesScreen> createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance
      .ref('cases'); // Reference to the 'cases' node in Firebase
  String? selectedCasesId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Setting the scaffold background color to black
      appBar: AppBar(
        title: Text(
          'PC CASE VARIANTS',
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
              query: ref, // Firebase reference to fetch cases
              defaultChild: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                  // Green accent color
                  strokeWidth: 4.0, // Adjust thickness
                ),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                // Fetching the case data from Firebase
                String casesId = snapshot.key ?? '';
                String imageUrl = snapshot.child('image_url').value.toString();
                String name = snapshot.child('name').value.toString();
                String internalBays =
                    snapshot.child('internal_bays').value.toString();
                String sidePanel =
                    snapshot.child('side_panel').value.toString();
                String type = snapshot.child('type').value.toString();
                String volume = snapshot.child('volume').value.toString();
                String pricePkr = snapshot.child('price_pkr').value.toString();
                String color =
                    snapshot.child('color').value.toString(); // Fetch color

                bool isSelected = casesId == selectedCasesId;

                return Column(
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      leading: Container(
                        width: 60,
                        height: 90,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.greenAccent, width: 2),
                          // Green border
                          borderRadius: BorderRadius.circular(8),
                          // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.5),
                              // Green accent shadow
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
                          _buildInfoRow('Internal Bays: ', internalBays),
                          SizedBox(height: 5),
                          _buildInfoRow('Side Panel: ', sidePanel),
                          SizedBox(height: 5),
                          _buildInfoRow('Type: ', type),
                          SizedBox(height: 5),
                          _buildInfoRow('Volume: ', volume),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Price (PKR): ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  '$pricePkr',
                                  style: TextStyle(color: Colors.green),
                                  overflow: TextOverflow
                                      .ellipsis, // Prevents overflow
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          _buildInfoRow('Color: ', color), // Display color
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedCasesId = casesId;
                          });
                          Navigator.pop(context, {
                            'image_url': imageUrl,
                            'name': name,
                            'price_pkr': pricePkr,
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
                    // Grey line between variants
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
