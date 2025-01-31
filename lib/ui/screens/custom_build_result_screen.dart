import 'package:flutter/material.dart';

class CustomBuildResultScreen extends StatelessWidget {
  final Map<String, Map<String, dynamic>?> components;

  const CustomBuildResultScreen({super.key, required this.components});

  // Helper method to get a value from multiple possible keys
  String getFieldValue(Map<String, dynamic> component, List<String> possibleKeys, {String fallback = 'Unknown'}) {
    for (String key in possibleKeys) {
      if (component.containsKey(key) && component[key] != null) {
        return component[key].toString();
      }
    }
    return fallback;
  }

  // Helper method to round the total price to the nearest convenient number
  double roundToNearest(double value, int nearest) {
    return (value / nearest).round() * nearest.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    // Safely calculate the total price
    double totalPrice = components.values
        .where((component) => component != null) // Exclude null components
        .map((component) => double.tryParse(getFieldValue(component!, ['price', 'price_pkr'], fallback: '0')) ?? 0)
        .reduce((a, b) => a + b);

    // Round the total price to the nearest 100
    double roundedPrice = roundToNearest(totalPrice, 100);

    // Icon mapping for component types with custom labels
    final Map<String, Map<String, dynamic>> componentIcons = {
      'Processor': {'icon': Icons.memory, 'label': 'Processor'},
      'GPU': {'icon': Icons.videogame_asset, 'label': 'GPU'},
      'RAM': {'icon': Icons.storage, 'label': 'RAM'},
      'Motherboard': {'icon': Icons.developer_board_sharp, 'label': 'Motherboard'},
      'Power Supply': {'icon': Icons.power, 'label': 'Power Supply'},
      'Case': {'icon': Icons.computer, 'label': 'Case'},
      'SSD': {'icon': Icons.memory_outlined, 'label': 'SSD'},
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Build Summary',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'YOUR BUILD!',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  shadows: [
                    Shadow(
                      color: Colors.green.withOpacity(0.5),
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Image from assets at the top of the screen
            Container(
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                'assets/images/69.png', // Replace with your image path in the assets
                fit: BoxFit.contain,
              ),
            ),
            // GridView for components including the last component
            GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Reduced the count to fit smaller icons
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 1 / 1.2, // Adjusted aspect ratio for better fitting
              ),
              itemCount: components.entries.length, // Include all components in the grid
              shrinkWrap: true, // Prevent overflow by limiting the grid size
              itemBuilder: (context, index) {
                final entry = components.entries.elementAt(index);
                final componentType = entry.key;
                final component = entry.value;

                if (component == null) return const SizedBox.shrink();

                // Get the icon and label based on component type
                final componentIcon = componentIcons[componentType];
                final icon = componentIcon?['icon'] ?? Icons.device_unknown;
                final label = componentIcon?['label'] ?? 'Unknown';

                return Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Label above the icon with green color and shadow
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          label,
                          style: const TextStyle(
                            color: Colors.greenAccent, // Label color
                            fontWeight: FontWeight.bold,
                            fontSize: 12, // Font size

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Display the icon with a smaller size
                      Icon(
                        icon,
                        size: 30, // Smaller icon size
                        color: Colors.greenAccent,
                      ),
                      // Original component name beneath the icon
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          getFieldValue(component, ['name', 'brand_model', 'model']),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10, // Reduced font size
                          ),
                        ),
                      ),
                      // Component Price
                      Text(
                        '${getFieldValue(component, ['price', 'price_pkr'], fallback: '0')} RS',
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 12, // Adjusted font size for price
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            // Total Price
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              color: Colors.black,
              child: Text(
                'Estimated Price: ${roundedPrice.toStringAsFixed(2)} RS',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20, // Reduced font size for total price
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
