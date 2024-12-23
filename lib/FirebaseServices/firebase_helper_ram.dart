import 'package:firebase_database/firebase_database.dart';

class FirebaseHelperRAM {
  final DatabaseReference _ramRef = FirebaseDatabase.instance.ref('ram'); // Reference to 'ram' node

  // Function to add RAM data to Firebase manually
  Future<void> addRAMDataManually() async {
    // All the RAM data to upload
    final ramData = [
      {
        'brand_model': 'Corsair Vengeance RGB 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '28,497 PKR',
        'color': 'Black',
        'latency': '12 ns',
        'cas_latency': '36',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/894ce2f4aaaf96e8a0cc61288f9ff27d.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance LPX 16 GB',
        'capacity': '16 GB',
        'type_speed': 'DDR4-3200',
        'module_configuration': '2 x 8GB',
        'price': '11,634 PKR',
        'color': 'Black / Yellow',
        'latency': '10 ns',
        'cas_latency': '16',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/835ab3efad1be13bbe53beef3e3c6f96.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '35,997 PKR',
        'color': 'Black / Gray',
        'latency': '10 ns',
        'cas_latency': '30',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/fe414d3559a9bbb2e092ba5374f6e1ed.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance RGB Pro 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR4-3600',
        'module_configuration': '2 x 16GB',
        'price': '29,616 PKR',
        'color': 'Black',
        'latency': '10 ns',
        'cas_latency': '18',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/5f09867b54e9ad932b4dd1bc767f6238.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance LPX 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR4-3600',
        'module_configuration': '2 x 16GB',
        'price': '19,794 PKR',
        'color': 'Black / Yellow',
        'latency': '10 ns',
        'cas_latency': '18',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/11742fd6eec55fde4e3ee3a79529a111.1600.jpg'
      },
      {
        'brand_model': 'G.Skill Trident Z5 RGB 64 GB',
        'capacity': '64 GB',
        'type_speed': 'DDR5-6400',
        'module_configuration': '2 x 32GB',
        'price': '98,397 PKR',
        'color': 'Black / Silver',
        'latency': '10 ns',
        'cas_latency': '32',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/e5d0d71b07fa16cc1ac7eb3c676a7831.1600.jpg'
      },
      {
        'brand_model': 'TEAMGROUP T-Create Expert 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '26,437 PKR',
        'color': 'Black',
        'latency': '10 ns',
        'cas_latency': '30',
        'image_url': 'https://m.media-amazon.com/images/I/41Q6UMps9NL.jpg'
      },
      {
        'brand_model': 'G.Skill Flare X5 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '28,499 PKR',
        'color': 'Black',
        'latency': '10 ns',
        'cas_latency': '30',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/2a5856ab677607ec6f3b1c25bed693ab.1600.jpg'
      },
      {
        'brand_model': 'TEAMGROUP T-Force Delta RGB 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '29,484 PKR',
        'color': 'White',
        'latency': '10 ns',
        'cas_latency': '30',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/09e373465295e5629efd7959a7147a3b.1600.jpg'
      },
      {
        'brand_model': 'G.Skill Trident Z5 Neo RGB 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '30,234 PKR',
        'color': 'Black',
        'latency': '10 ns',
        'cas_latency': '30',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/a4cecff25f58230f3fbae1903d711e49.1600.jpg'
      },
      {
        'brand_model': 'G.Skill Ripjaws V 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR4-3200',
        'module_configuration': '2 x 16GB',
        'price': '9,459 PKR',
        'color': 'Black',
        'latency': '10 ns',
        'cas_latency': '16',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/f97fce0b44ff2447a790b0bffc74f9f3.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance 64 GB',
        'capacity': '64 GB',
        'type_speed': 'DDR5-5200',
        'module_configuration': '2 x 32GB',
        'price': '72,719 PKR',
        'color': 'Black',
        'latency': '15.385 ns',
        'cas_latency': '40',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/44511eed6b609f1979ca94fe5ed2e2ad.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance RGB 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '37,312 PKR',
        'color': 'White',
        'latency': '12 ns',
        'cas_latency': '36',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/ebca1cc55cb7829ce3ed0b8a13efce7e.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance LPX 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR4-3200',
        'module_configuration': '2 x 16GB',
        'price': '22,688 PKR',
        'color': 'Black / Yellow',
        'latency': '10 ns',
        'cas_latency': '16',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/ae9c14173c768f2fa9ad4d3c957e94a0.1600.jpg'
      },
      {
        'brand_model': 'Crucial Pro Overclocking 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '27,906 PKR',
        'color': 'Black',
        'latency': '12 ns',
        'cas_latency': '36',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/9fdbfba897aab27f8669458508239fe1.1600.jpg'
      },
      {
        'brand_model': 'Silicon Power GAMING 16 GB',
        'capacity': '16 GB',
        'type_speed': 'DDR4-3200',
        'module_configuration': '2 x 8GB',
        'price': '7,478 PKR',
        'color': 'Black / Gray',
        'latency': '10 ns',
        'cas_latency': '16',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/62a4ba196f5f165e68619a63ef5d0b70.1600.jpg'
      },
      {
        'brand_model': 'TEAMGROUP T-Force Delta RGB 32 GB',
        'capacity': '32 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 16GB',
        'price': '29,484 PKR',
        'color': 'Black',
        'latency': '10 ns',
        'cas_latency': '30',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/d2e3f9b94f541ad51a19011026245df2.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance RGB 64 GB',
        'capacity': '64 GB',
        'type_speed': 'DDR5-6000',
        'module_configuration': '2 x 32GB',
        'price': '98,397 PKR',
        'color': 'Black',
        'latency': '10 ns',
        'cas_latency': '30',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/5cdd0dfcd25374317a12808fa7f63c19.1600.jpg'
      },
      {
        'brand_model': 'Corsair Vengeance RGB Pro 16 GB',
        'capacity': '16 GB',
        'type_speed': 'DDR4-3200',
        'module_configuration': '2 x 8GB',
        'price': '16,312 PKR',
        'color': 'Black',
        'latency': '10 ns',
        'cas_latency': '16',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/87cd8e9d02ffb0997769f4a4d5969669.1600.jpg'
      }
    ];

    for (var ram in ramData) {
      try {
        await _ramRef.push().set(ram);
        print("RAM data added successfully: ${ram['brand_model']}");
      } catch (e) {
        print("Failed to add RAM data: $e");
      }
    }
  }
}
