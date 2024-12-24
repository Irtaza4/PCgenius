import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class RAMScreen extends StatefulWidget {
  const RAMScreen({super.key});

  @override
  State<RAMScreen> createState() => _RAMScreenState();
}

class _RAMScreenState extends State<RAMScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('ram'); // Reference to the 'rams' node in Firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'RAM VARIANTS',
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
              query: ref, // Firebase reference to fetch RAM variants
              defaultChild: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                  strokeWidth: 4.0,
                ),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                // Fetching the RAM data from Firebase
                String imageUrl = snapshot.child('image_url').value.toString();
                String brandModel = snapshot.child('brand_model').value.toString();
                String capacity = snapshot.child('capacity').value.toString();
                String casLatency = snapshot.child('cas_latency').value.toString();
                String latency = snapshot.child('latency').value.toString();
                String color = snapshot.child('color').value.toString();
                String modelConfiguration = snapshot.child('module_configuration').value.toString();
                String typeSpeed = snapshot.child('type_speed').value.toString();
                String price = snapshot.child('price').value.toString();

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
                        brandModel,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('Capacity: ', capacity),
                          SizedBox(height: 5),
                          _buildInfoRow('CAS Latency: ', casLatency),
                          SizedBox(height: 5),
                          _buildInfoRow('Latency: ', latency),
                          SizedBox(height: 5),
                          _buildInfoRow('Color: ', color),
                          SizedBox(height: 5),
                          _buildInfoRow('Configuration: ', modelConfiguration),
                          SizedBox(height: 5),
                          _buildInfoRow('Type/Speed: ', typeSpeed),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Price: ',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  '$price \RS',
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
                          print("Added $brandModel to the build");
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
