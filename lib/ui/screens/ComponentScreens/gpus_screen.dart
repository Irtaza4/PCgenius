import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class GPUScreen extends StatefulWidget {
  const GPUScreen({super.key, Map<String, String>? selectedGpu});

  @override
  State<GPUScreen> createState() => _GPUScreenState();
}

class _GPUScreenState extends State<GPUScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance
      .ref('gpu'); // Reference to the 'gpu' node in Firebase
  String? selectedGpuId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Setting the scaffold background color to black
      appBar: AppBar(
        title: Text(
          'GPU VARIANTS',
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
              colors: [
                Colors.black,
                Colors.green
              ], // Color change to green for GPU section
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref, // Firebase reference to fetch GPUs
              defaultChild: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                  // Green accent color
                  strokeWidth: 4.0, // Adjust thickness
                ),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                // Fetching the GPU data from Firebase
                String gpuId = snapshot.key ?? '';
                String imageUrl = snapshot.child('image_url').value.toString();
                String model = snapshot.child('model').value.toString();
                String vram = snapshot.child('vram').value.toString();
                String length = snapshot.child('length').value.toString();
                String baseClock =
                    snapshot.child('base_clock').value.toString();
                String boostClock =
                    snapshot.child('boost_clock').value.toString();
                String color = snapshot.child('color').value.toString();
                String price = snapshot.child('price').value.toString();

                bool isSelected = gpuId == selectedGpuId;

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
                          // Green border for GPU section
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
                        model,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('VRAM: ', vram),
                          SizedBox(height: 5),
                          _buildInfoRow('Length: ', length),
                          SizedBox(height: 5),
                          _buildInfoRow('Base Clock: ', baseClock),
                          SizedBox(height: 5),
                          _buildInfoRow('Boost Clock: ', boostClock),
                          SizedBox(height: 5),
                          _buildInfoRow('Color: ', color),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Price: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  '$price ',
                                  style: TextStyle(color: Colors.greenAccent),
                                  overflow: TextOverflow
                                      .ellipsis, // Prevents overflow
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedGpuId = gpuId;
                          });
                          Navigator.pop(context, {
                            'image_url': imageUrl,
                            'model': model,
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
