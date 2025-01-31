import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class PowerSuppliesScreen extends StatefulWidget {
  const PowerSuppliesScreen({super.key, Map<String, dynamic>? selectedPowerSupply});

  @override
  State<PowerSuppliesScreen> createState() => _PowerSuppliesScreenState();
}

class _PowerSuppliesScreenState extends State<PowerSuppliesScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('power_supplies'); // Reference to the 'power_supplies' node in Firebase
  String? selectedPowerSupplyId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Setting the scaffold background color to black
      appBar: AppBar(
        title: const Text(
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
              query: ref, // Firebase reference to fetch power supplies
              defaultChild: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent), // Green accent color
                  strokeWidth: 4.0, // Adjust thickness
                ),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                // Fetching the power supply data from Firebase
                String powerSupplyId = snapshot.key ?? '';
                String imageUrl = snapshot.child('image_url').value.toString();
                String name = snapshot.child('name').value.toString();
                String modular = snapshot.child('modular').value.toString();
                String pricePkr = snapshot.child('price_pkr').value.toString();
                String type = snapshot.child('type').value.toString();
                String color = snapshot.child('color').value.toString();
                String certification = snapshot.child('certification').value.toString();
                String wattage = snapshot.child('wattage').value.toString();

                bool isSelected = powerSupplyId == selectedPowerSupplyId;

                return Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                              offset: const Offset(2, 4), // Shadow offset
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
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('Modular: ', modular),
                          const SizedBox(height: 5),
                          _buildInfoRow('Type: ', type),
                          const SizedBox(height: 5),
                          _buildInfoRow('Color: ', color),
                          const SizedBox(height: 5),
                          _buildInfoRow('Certification: ', certification),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                'Price: ',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  '$pricePkr RS',
                                  style: const TextStyle(color: Colors.green),
                                  overflow: TextOverflow.ellipsis, // Prevents overflow
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          _buildInfoRow('Wattage: ', wattage),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedPowerSupplyId = powerSupplyId;
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
                    const Divider(color: Colors.grey, thickness: 1), // Grey line between variants
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
            overflow: TextOverflow.ellipsis, // Prevents text overflow
          ),
        ),
      ],
    );
  }
}
