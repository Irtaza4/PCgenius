import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utils.dart';
import '../login_screen.dart';

class ProcessorsScreen extends StatefulWidget {
  const ProcessorsScreen({super.key, Map<String, dynamic>? selectedProcessor});

  @override
  State<ProcessorsScreen> createState() => _ProcessorsScreenState();
}

class _ProcessorsScreenState extends State<ProcessorsScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('cpus'); // Reference to the 'cpus' node in Firebase
  String? selectedProcessorId; // Stores the ID of the selected processor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'PROCESSORS VARIANTS',
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
              query: ref,
              defaultChild: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                  strokeWidth: 4.0,
                ),
              ),
              itemBuilder: (context, snapshot, animation, index) {
                // Fetch processor data
                String processorId = snapshot.key ?? ''; // Unique ID of the processor
                String imageUrl = snapshot.child('image').value.toString();
                String name = snapshot.child('name').value.toString();
                String cores = snapshot.child('cores').value.toString();
                String baseClock = snapshot.child('baseClock').value.toString();
                String boostClock = snapshot.child('boostClock').value.toString();
                String architecture = snapshot.child('architecture').value.toString();
                String tdp = snapshot.child('tdp').value.toString();
                String integratedGraphics = snapshot.child('integratedGraphics').value.toString();
                String price = snapshot.child('price').value.toString();

                bool isSelected = processorId == selectedProcessorId;

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
                          _buildInfoRow('Cores: ', cores),
                          _buildInfoRow('Base Clock: ', baseClock),
                          _buildInfoRow('Boost Clock: ', boostClock),
                          _buildInfoRow('Architecture: ', architecture),
                          _buildInfoRow('TDP: ', tdp),
                          _buildInfoRow('Integrated Graphics: ', integratedGraphics),
                          Row(
                            children: [
                              const Text(
                                'Price: ',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  '$price RS',
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
                            selectedProcessorId = processorId;
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
