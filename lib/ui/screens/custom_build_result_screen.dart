import 'package:flutter/material.dart';

class CustomBuildResultScreen extends StatelessWidget {
  final Map<String, Map<String, dynamic>?> components;

  CustomBuildResultScreen({required this.components});

  // Helper method to get a value from multiple possible keys
  String getFieldValue(Map<String, dynamic> component, List<String> possibleKeys, {String fallback = 'Unknown'}) {
    for (String key in possibleKeys) {
      if (component.containsKey(key) && component[key] != null) {
        return component[key].toString();
      }
    }
    return fallback;
  }

  @override
  Widget build(BuildContext context) {
    // Safely calculate the total price
    double totalPrice = components.values
        .where((component) => component != null) // Exclude null components
        .map((component) => double.tryParse(getFieldValue(component!, ['price', 'price_pkr'], fallback: '0')) ?? 0)
        .reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Build Summary',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
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
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 3 / 4,
              ),
              itemCount: components.values.length,
              itemBuilder: (context, index) {
                final entry = components.entries.elementAt(index);
                final component = entry.value;

                if (component == null) return const SizedBox.shrink();

                return Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // Component Name
                      // Component Name with green accent shadow
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                        child: Text(
                          getFieldValue(component, ['name', 'brand_model', 'model']),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            shadows: [
                              Shadow(
                                color: Colors.greenAccent.withOpacity(0.5),
                                offset: Offset(4.0, 4.0),
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Component Image with green accent shadow
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 3,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 100,
                            child: getFieldValue(component, ['image', 'image_url']) != 'Unknown'
                                ? Image.network(
                              getFieldValue(component, ['image', 'image_url']),
                              fit: BoxFit.contain,
                            )
                                : const Icon(Icons.image_not_supported, color: Colors.white),
                          ),
                        ),
                      ),
                      // Component Price with adjusted spacing
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          '${getFieldValue(component, ['price', 'price_pkr'], fallback: '0')} RS',
                          style: const TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Total Price
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.black,
            child: Text(
              'Total Price: ${totalPrice.toStringAsFixed(2)} RS',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,


              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
