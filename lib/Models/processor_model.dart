class Processor {
  final String name;
  final int cores;
  final String baseClock;
  final String boostClock;
  final String architecture;
  final String tdp;
  final String integratedGraphics;
  final double price;
  final String image;

  Processor({
    required this.name,
    required this.cores,
    required this.baseClock,
    required this.boostClock,
    required this.architecture,
    required this.tdp,
    required this.integratedGraphics,
    required this.price,
    required this.image,
  });

  // Create a Processor from a Map
  factory Processor.fromMap(Map<String, dynamic> data) {
    return Processor(
      name: data['name'],
      cores: data['cores'],
      baseClock: data['baseClock'],
      boostClock: data['boostClock'],
      architecture: data['architecture'],
      tdp: data['tdp'],
      integratedGraphics: data['integratedGraphics'],
      price: data['price'],
      image: data['image'],
    );
  }
}
