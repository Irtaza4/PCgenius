import 'package:flutter/material.dart';
import 'package:pc_genius/Utils/utils.dart';
import '../../Models/pc_build_data.dart';

class BuildResultsScreen extends StatelessWidget {
  final String budget;
  final String pcType;

  const BuildResultsScreen({super.key, required this.budget, required this.pcType});

  // Helper method to convert the budget string to an integer
  int get budgetValue => int.tryParse(budget) ?? 0;

  @override
  Widget build(BuildContext context) {
    // Find the appropriate PC build based on the budget and PC type
    var buildData = _getBuildData();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Your Build",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: buildData.isNotEmpty
            ? SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Your Preferred $pcType PC',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                  wordSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Colors.green.withOpacity(0.5),
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'With Budget of $budget',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Colors.green.withOpacity(0.5),
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),

                ),
                child: Image.asset(
                  'assets/images/112.png',
                  width: 250,
                  height: 200,

                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side
                  Expanded(
                    child: Column(
                      children: [
                        _buildIcon(Icons.computer_outlined, 'Processor'),
                        Text(buildData['Processor']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12)),
                        const SizedBox(height: 20),
                        _buildIcon(Icons.memory, 'RAM'),
                        Text(buildData['RAM']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12)),
                        const SizedBox(height: 20),
                        _buildIcon(Icons.storage, 'HDD'),
                        Text(buildData['HDD']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12)),
                        const SizedBox(height: 20),
                        _buildIcon(Icons.power, 'Power Supply'),
                        Text(buildData['PowerSupply']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12)),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  // Right side
                  Expanded(
                    child: Column(
                      children: [
                        _buildIcon(Icons.video_label, 'Graphics Card (GPU)'),
                        Text(buildData['GPU']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12)),
                        const SizedBox(height: 20),
                        _buildIcon(Icons.storage, 'SSD'),
                        Text(buildData['SSD']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12)),
                        const SizedBox(height: 20),
                        _buildIcon(Icons.developer_board_sharp, 'Motherboard'),
                        Text(buildData['Motherboard']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12)),
                        const SizedBox(height: 20),
                        _buildIcon(Icons.tv, 'Case'),
                        Text(buildData['Case']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12)),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
            : const Center(
          child: Text(
            'No suitable builds found for this budget and PC type.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // This method selects the appropriate build data based on the budget and pcType
  Map<String, String> _getBuildData() {
    // Filter builds based on the budget and pcType
    List<Map<String, dynamic>> builds=[];
    if (pcType == 'Gaming') {
      builds = PcBuildData.gamingBuilds;
    } else if (pcType == 'Office Work') {
      builds = PcBuildData.officeWorkBuilds;
    } else if (pcType == 'Graphic Designing') {
      builds = PcBuildData.graphicDesigningBuilds;
    }

    for (var build in builds) {
      if (budgetValue >= build['minBudget'] && budgetValue <= build['maxBudget']) {
        return build['build'];
      }
    }
  
    Utils().toastMessage('Try Again');
    return {}; // Return an empty map to stay on the same screen
  }

  Widget _buildIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.green,
          size: 30,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}