import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pc_genius/ui/screens/ComponentScreens/cases_screen.dart';
import 'package:pc_genius/ui/screens/ComponentScreens/gpus_screen.dart';
import 'package:pc_genius/ui/screens/ComponentScreens/motherboards_screen.dart';
import 'package:pc_genius/ui/screens/ComponentScreens/power_supplies_screen.dart';
import 'package:pc_genius/ui/screens/ComponentScreens/processors_screen.dart';
import 'package:pc_genius/ui/screens/ComponentScreens/rams_screen.dart';
import 'package:pc_genius/ui/screens/login_screen.dart';
import '../../Utils/utils.dart';
import '../../Widgets/Custom_button.dart';

class CustomBuild extends StatefulWidget {
  const CustomBuild({super.key});

  @override
  State<CustomBuild> createState() => _CustomBuildState();
}

class _CustomBuildState extends State<CustomBuild> {
  final _auth = FirebaseAuth.instance;
  bool isLoadingProcessor = false;
  bool isLoadingRAM = false;
  bool isLoadingMotherboard = false;
  bool isLoadingGPU = false;
  bool isLoadingPowerSupply = false;
  bool isLoadingCases = false;

  Map<String, String>? selectedProcessor;
  Map<String, String>? selectedRam;
  Map<String, String>? selectedGpus;
  Map<String, String>? selectedPowerSupplies;
  Map<String, String>? selectedMotherBoards;
  Map<String, String>? selectedCases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'CUSTOM BUILD',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Center(
              child: Text(
                'ADD COMPONENTS',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  shadows: [
                    Shadow(
                      color: Colors.green.withOpacity(0.5),
                      offset: Offset(3.0, 3.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          label: "PROCESSOR",
                          icon: Icons.computer_outlined,
                          onTap: () async {
                            setState(() {
                              isLoadingProcessor = true;
                            });

                            final selectedProcessorData = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProcessorsScreen()),
                            );

                            setState(() {
                              isLoadingProcessor = false;
                              if (selectedProcessorData != null) {
                                selectedProcessor = selectedProcessorData;
                              }
                            });
                          },
                          isLoading: isLoadingProcessor,
                          backgroundColor: selectedProcessor != null
                              ? Colors.green
                              : Colors.black,
                          textColor: selectedProcessor != null
                              ? Colors.black
                              : Colors.white,
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          label: "RAM",
                          icon: Icons.memory,
                          onTap: () async {
                            setState(() {
                              isLoadingRAM = true;
                            });

                            final selectedRamData = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RAMScreen()),
                            );

                            setState(() {
                              isLoadingRAM = false;
                              if (selectedRamData != null) {
                                selectedRam = selectedRamData;
                              }
                            });
                          },
                          isLoading: isLoadingRAM,
                          backgroundColor: selectedRam != null
                              ? Colors.green
                              : Colors.black,
                          textColor: selectedRam != null
                              ? Colors.black
                              : Colors.white,
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          label: "MOTHERBOARD",
                          icon: Icons.developer_board_sharp,
                          onTap: () async {
                            setState(() {
                              isLoadingMotherboard = true;
                            });

                            final selectedMotherboardData = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MotherboardsScreen()),
                            );

                            setState(() {
                              isLoadingMotherboard = false;
                              if (selectedMotherboardData != null) {
                                selectedMotherBoards = selectedMotherboardData;
                              }
                            });
                          },
                          isLoading: isLoadingMotherboard,
                          backgroundColor: selectedMotherBoards != null
                              ? Colors.green
                              : Colors.black,
                          textColor: selectedMotherBoards != null
                              ? Colors.black
                              : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          label: "GPU",
                          icon: Icons.video_label,
                          onTap: () async {
                            setState(() {
                              isLoadingGPU = true;
                            });

                            final selectedGpuData = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GPUScreen()),
                            );

                            setState(() {
                              isLoadingGPU = false;
                              if (selectedGpuData != null) {
                                selectedGpus = selectedGpuData;
                              }
                            });
                          },
                          isLoading: isLoadingGPU,
                          backgroundColor: selectedGpus != null
                              ? Colors.green
                              : Colors.black,
                          textColor: selectedGpus != null
                              ? Colors.black
                              : Colors.white,
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          label: "POWER SUPPLY",
                          icon: Icons.power,
                          onTap: () async {
                            setState(() {
                              isLoadingPowerSupply = true;
                            });

                            final selectedPowerSupplyData =
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PowerSuppliesScreen()),
                            );

                            setState(() {
                              isLoadingPowerSupply = false;
                              if (selectedPowerSupplyData != null) {
                                selectedPowerSupplies = selectedPowerSupplyData;
                              }
                            });
                          },
                          isLoading: isLoadingPowerSupply,
                          backgroundColor: selectedPowerSupplies != null
                              ? Colors.green
                              : Colors.black,
                          textColor: selectedPowerSupplies != null
                              ? Colors.black
                              : Colors.white,
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          label: "CASES",
                          icon: Icons.tv,
                          onTap: () async {
                            setState(() {
                              isLoadingCases = true;
                            });

                            final selectedCasesData = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CasesScreen()),
                            );

                            setState(() {
                              isLoadingCases = false;
                              if (selectedCasesData != null) {
                                selectedCases = selectedCasesData;
                              }
                            });
                          },
                          isLoading: isLoadingCases,
                          backgroundColor: selectedCases != null
                              ? Colors.green
                              : Colors.black,
                          textColor: selectedCases != null
                              ? Colors.black
                              : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                // Processor Card
                if (selectedProcessor != null)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    elevation: 5,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: selectedProcessor != null ? Colors.greenAccent : Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.transparent, width: 0),
                        ),
                        child: Image.network(selectedProcessor!['image']!, width: 40, height: 40),
                      ),
                      title: Text(
                        selectedProcessor!['name']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        ' ${selectedProcessor!['price']} PKR',
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                selectedProcessor = null;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.update, color: Colors.greenAccent), // Change color here
                            onPressed: () async {
                              final updatedProcessor = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProcessorsScreen(
                                    selectedProcessor: selectedProcessor, // Pass current selection
                                  ),
                                ),
                              );

                              if (updatedProcessor != null) {
                                setState(() {
                                  selectedProcessor = updatedProcessor; // Update with the new selection
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Container(),

                Divider(color: Colors.transparent),

                // RAM Card
                if (selectedRam != null)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    elevation: 5,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: selectedRam != null ? Colors.greenAccent : Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.transparent, width: 0),
                        ),
                        child: Image.network(selectedRam!['image_url']!, width: 40, height: 40),
                      ),
                      title: Text(
                        selectedRam!['brand_model']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        ' ${selectedRam!['price']} ',
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                selectedRam = null;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.update, color: Colors.greenAccent), // Change color here
                            onPressed: () async {
                              final updatedRam = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RAMScreen(
                                    selectedRam: selectedRam, // Pass current selection
                                  ),
                                ),
                              );

                              if (updatedRam != null) {
                                setState(() {
                                  selectedRam = updatedRam; // Update with the new selection
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Container(),

                Divider(color: Colors.transparent),

                // Motherboard Card
                if (selectedMotherBoards != null)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    elevation: 5,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: selectedMotherBoards != null ? Colors.greenAccent : Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.transparent, width: 0),
                        ),
                        child: Image.network(selectedMotherBoards!['image']!, width: 40, height: 40),
                      ),
                      title: Text(
                        selectedMotherBoards!['name']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        ' ${selectedMotherBoards!['price']} ',
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                selectedMotherBoards = null;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.update, color: Colors.greenAccent), // Change color here
                            onPressed: () async {
                              final updatedMotherboard = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MotherboardsScreen(
                                    selectedMotherBoard: selectedMotherBoards, // Pass current selection
                                  ),
                                ),
                              );

                              if (updatedMotherboard != null) {
                                setState(() {
                                  selectedMotherBoards = updatedMotherboard; // Update with the new selection
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Container(),

                Divider(color: Colors.transparent),

                // GPU Card
                if (selectedGpus != null)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    elevation: 5,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: selectedGpus != null ? Colors.greenAccent : Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.transparent, width: 0),
                        ),
                        child: Image.network(selectedGpus!['image_url']!, width: 40, height: 40),
                      ),
                      title: Text(
                        selectedGpus!['model']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        ' ${selectedGpus!['price']} ',
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                selectedGpus = null;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.update, color: Colors.greenAccent), // Change color here
                            onPressed: () async {
                              final updatedGpu = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GPUScreen(
                                    selectedGpu: selectedGpus, // Pass current selection
                                  ),
                                ),
                              );

                              if (updatedGpu != null) {
                                setState(() {
                                  selectedGpus = updatedGpu; // Update with the new selection
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Container(),

                Divider(color: Colors.transparent),

                // Power Supply Card
                if (selectedPowerSupplies != null)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    elevation: 5,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: selectedPowerSupplies != null ? Colors.greenAccent : Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.transparent, width: 0),
                        ),
                        child: Image.network(selectedPowerSupplies!['image_url']!, width: 40, height: 40),
                      ),
                      title: Text(
                        selectedPowerSupplies!['name']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        ' ${selectedPowerSupplies!['price_pkr']} PKR',
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                selectedPowerSupplies = null;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.update, color: Colors.greenAccent), // Change color here
                            onPressed: () async {
                              final updatedPowerSupply = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PowerSuppliesScreen(
                                    selectedPowerSupply: selectedPowerSupplies, // Pass current selection
                                  ),
                                ),
                              );

                              if (updatedPowerSupply != null) {
                                setState(() {
                                  selectedPowerSupplies = updatedPowerSupply; // Update with the new selection
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Container(),

                Divider(color: Colors.transparent),

                // Case Card
                if (selectedCases != null)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    elevation: 5,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: selectedCases != null ? Colors.greenAccent : Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.transparent, width: 0),
                        ),
                        child: Image.network(selectedCases!['image_url']!, width: 40, height: 40),
                      ),
                      title: Text(
                        selectedCases!['name']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        ' ${selectedCases!['price_pkr']} PKR',
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                selectedCases = null;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.update, color: Colors.greenAccent), // Change color here
                            onPressed: () async {
                              final updatedCase = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CasesScreen(
                                    selectedCase: selectedCases, // Pass current selection
                                  ),
                                ),
                              );

                              if (updatedCase != null) {
                                setState(() {
                                  selectedCases = updatedCase; // Update with the new selection
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Container(),
              ],
            ),


          ],
        ),
      ),
    );
  }
}



