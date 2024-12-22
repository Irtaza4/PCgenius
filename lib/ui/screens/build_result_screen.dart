import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Add this import for FontAwesome icons

class BuildResultsScreen extends StatelessWidget {
  final String budget;
  final String pcType;

  const BuildResultsScreen({Key? key, required this.budget, required this.pcType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Your Build",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Your Preferred $pcType PC',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3,
                  wordSpacing: 2,

                  shadows: [
                    Shadow(
                      color: Colors.green.withOpacity(0.5),
                      offset: Offset(3.0, 3.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'With Budget of $budget',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
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
              SizedBox(height: 30),
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/112.png',
                  width: 250,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side
                  Expanded(
                    child: Column(
                      children: [
                        _buildIcon(Icons.computer_outlined, 'Processor'),
                        Text('AMD Ryzen 9 7950X', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        _buildIcon(Icons.memory, 'Ram'),
                        Text('128GB DDR5', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        _buildIcon(Icons.storage, 'HDD'),
                        Text('Seagate 6TB HDD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        _buildIcon(Icons.power, 'Power Supply'),
                        Text('Corsair AX1600i', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                      ],

                    ),
                  ),
                  // Right side
                  Expanded(
                    child: Column(
                      children: [
                        _buildIcon(Icons.video_label, 'Graphics Card (GPU)'),
                        Text('NVIDIA RTX 4090', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        _buildIcon(Icons.storage, 'SSD'),
                        Text('Samsung 4TB NVMe SSD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        _buildIcon(Icons.developer_board_sharp, 'Motherboard'),
                        Text('ASUS ROG Crosshair X670E Hero', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        _buildIcon(Icons.tv, 'Case'),
                        Text('Lian Li PC-O11 Dynamic XL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.green,
          size: 30,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
