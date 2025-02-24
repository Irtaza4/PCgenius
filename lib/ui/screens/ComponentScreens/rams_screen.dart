import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class RAMScreen extends StatefulWidget {
  const RAMScreen({super.key, Map<String, dynamic>? selectedRam});

  @override
  State<RAMScreen> createState() => _RAMScreenState();
}

class _RAMScreenState extends State<RAMScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('ram'); // Reference to the 'rams' node in Firebase
  String selectedRAM = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
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
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
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

      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref, // Firebase reference to fetch RAM variants
              defaultChild: const Center(
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

                bool isSelected = selectedRAM == brandModel;

                return Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                              offset: const Offset(2, 4),
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
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('Capacity: ', capacity),
                          const SizedBox(height: 5),
                          _buildInfoRow('CAS Latency: ', casLatency),
                          const SizedBox(height: 5),
                          _buildInfoRow('Latency: ', latency),
                          const SizedBox(height: 5),
                          _buildInfoRow('Color: ', color),
                          const SizedBox(height: 5),
                          _buildInfoRow('Configuration: ', modelConfiguration),
                          const SizedBox(height: 5),
                          _buildInfoRow('Type/Speed: ', typeSpeed),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                'Price: ',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  '$price ',
                                  style: const TextStyle(color: Colors.green),
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
                            selectedRAM = brandModel;
                          });
                          Navigator.pop(context, {
                            'image_url': imageUrl,
                            'brand_model': brandModel,
                            'price': price,
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected ? Colors.black : Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child:  Text(
                          isSelected ? 'Added' : 'Add',
                          style: TextStyle(color: isSelected ? Colors.green : Colors.white),
                        ),
                      ),
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
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
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
