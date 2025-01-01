import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class SsdScreen extends StatefulWidget {
  const SsdScreen({super.key, Map<String, dynamic>? selectedSsd});

  @override
  State<SsdScreen> createState() => _SsdScreenState();
}

class _SsdScreenState extends State<SsdScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('ssd'); // Reference to the 'cpus' node in Firebase
  String? selectedSsdId; // Stores the ID of the selected processor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'STORAGE VARIANTS',
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
                // Fetch processor data
                String ssdId = snapshot.key ?? ''; // Unique ID of the processor
                String imageUrl = snapshot.child('image').value.toString();
                String name = snapshot.child('name').value.toString();
                String capacity = snapshot.child('capacity').value.toString();
                String formFactor = snapshot.child('form_factor').value.toString();
                String interface = snapshot.child('interface').value.toString();
                String type = snapshot.child('type').value.toString();
                // String tdp = snapshot.child('tdp').value.toString();
                // String integratedGraphics = snapshot.child('integratedGraphics').value.toString();
                String price = snapshot.child('price').value.toString();

                bool isSelected = ssdId == selectedSsdId;

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
                          _buildInfoRow('type', type),
                          _buildInfoRow('form_factor', formFactor ),
                          _buildInfoRow('capacity',capacity),
                          _buildInfoRow('interface', interface),

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
                          setState(() {
                            selectedSsdId = ssdId;
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
