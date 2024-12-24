import 'package:firebase_database/firebase_database.dart';

class FirebaseHelperGPU {
  final DatabaseReference _gpuRef = FirebaseDatabase.instance.ref('gpu'); // Reference to 'gpu' node

  // Function to add GPU data to Firebase manually
  Future<void> addGPUDataManually() async {
    // All the GPU data to upload
    final gpuData = [
      {
        'model': 'MSI GeForce RTX 3060 Ventus 2X 12G',
        'vram': '12 GB',
        'base_clock': '1320 MHz',
        'boost_clock': '1777 MHz',
        'color': 'Black',
        'length': '235 mm',
        'price': '81,877 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/dbc81b89efc82ce66fb2e3ab7e0f0658.1600.jpg'
      },
      {
        'model': 'MSI VENTUS 2X BLACK OC',
        'vram': '8 GB',
        'base_clock': '1830 MHz',
        'boost_clock': '2505 MHz',
        'color': 'Black',
        'length': '199 mm',
        'price': '86,010 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/c89cc9ea2051206aebd4189ddf05f76b.1600.jpg'
      },
      {
        'model': 'Gigabyte WINDFORCE OC',
        'vram': '12 GB',
        'base_clock': '1980 MHz',
        'boost_clock': '2505 MHz',
        'color': 'Black',
        'length': '261 mm',
        'price': '173,996 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/c17472cd578b7847c10089750b161a2f.1600.jpg'
      },
      {
        'model': 'Gigabyte GAMING OC',
        'vram': '16 GB',
        'base_clock': '1295 MHz',
        'boost_clock': '2565 MHz',
        'color': 'Black',
        'length': '302 mm',
        'price': 'N/A',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/7760e2607e7488a74486e8de8d3162b5.1600.jpg'
      },
      {
        'model': 'ASRock Challenger D',
        'vram': '8 GB',
        'base_clock': '1626 MHz',
        'boost_clock': 'N/A',
        'color': 'Black',
        'length': '269 mm',
        'price': '55,010 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/c5489241c902a9ae06a42212e978f989.1600.jpg'
      },
      {
        'model': 'Gigabyte WINDFORCE OC',
        'vram': '16 GB',
        'base_clock': '2340 MHz',
        'boost_clock': '2625 MHz',
        'color': 'Black',
        'length': '261 mm',
        'price': '333,493 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/6b90f36fbe6c1408ac40ab85c762807c.1600.jpg'
      },
      {
        'model': 'Asus ROG STRIX GAMING OC',
        'vram': '24 GB',
        'base_clock': '2235 MHz',
        'boost_clock': '2640 MHz',
        'color': 'Black',
        'length': '358 mm',
        'price': 'N/A',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/59c719f5155104671c66994cc7d85c96.1600.jpg'
      },
      {
        'model': 'Gigabyte WINDFORCE V2',
        'vram': '16 GB',
        'base_clock': '2210 MHz',
        'boost_clock': '2550 MHz',
        'color': 'Black',
        'length': '330 mm',
        'price': '412,694 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/906bb4342e5338eb27a11a439afe80ff.1600.jpg'
      },
      {
        'model': 'Gigabyte WINDFORCE OC',
        'vram': '12 GB',
        'base_clock': '1710 MHz',
        'boost_clock': '1830 MHz',
        'color': 'Black',
        'length': '280 mm',
        'price': '92,500 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/772cce097c55469671a0d75ea4aca83a.1600.jpg'
      },
      {
        'model': 'Gigabyte GAMING OC',
        'vram': '12 GB',
        'base_clock': '1700 MHz',
        'boost_clock': '2599 MHz',
        'color': 'Black',
        'length': '302 mm',
        'price': '173,996 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/4255608ed3c98ddaaf0dc26bc7d2c982.1600.jpg'
      },
      {
        'model': 'Asus TUF GAMING OC',
        'vram': '16 GB',
        'base_clock': '2340 MHz',
        'boost_clock': '2670 MHz',
        'color': 'Black',
        'length': '305 mm',
        'price': '246,210 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/b0789be09cf15d356b010a73a7d3c96f.1600.jpg'
      },
      {
        'model': 'XFX Speedster QICK 319 Core',
        'vram': '12 GB',
        'base_clock': '2150 MHz',
        'boost_clock': '2600 MHz',
        'color': 'Black',
        'length': '323 mm',
        'price': '95,757 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/165da78d04ac3356f2b48e70fd34d044.1600.jpg'
      },
      {
        'model': 'Gigabyte GAMING OC',
        'vram': '16 GB',
        'base_clock': '1720 MHz',
        'boost_clock': '2810 MHz',
        'color': 'Black/Gray',
        'length': '281 mm',
        'price': '91,496 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/b537a4618dfe7ddd95ae47d707977a18.1600.jpg'
      },
      {
        'model': 'MSI VENTUS 2X BLACK OC',
        'vram': '16 GB',
        'base_clock': '2310 MHz',
        'boost_clock': '2625 MHz',
        'color': 'Black',
        'length': '199 mm',
        'price': '130,000 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/8740510e5c21901f28302bbcf3950e12.1600.jpg'
      },
      {
        'model': 'ASRock Challenger OC',
        'vram': '16 GB',
        'base_clock': '1295 MHz',
        'boost_clock': '2475 MHz',
        'color': 'Black',
        'length': '267 mm',
        'price': '142,102 PKR',
        'image_url': 'https://www.asrock.com/Graphics-Card/AMD/RX6800XT%20CHALLENGER%20OC%2016G/'
      },
      {
        'model': 'MSI VENTUS 3X OC',
        'vram': '16 GB',
        'base_clock': '2210 MHz',
        'boost_clock': '2595 MHz',
        'color': 'Black',
        'length': '322 mm',
        'price': '298,686 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/df6b1a3641b0a96940e7e5ce77685bad.1600.jpg'
      },
      {
        'model': 'Gigabyte WINDFORCE OC',
        'vram': '8 GB',
        'base_clock': '1830 MHz',
        'boost_clock': 'N/A',
        'color': 'Black',
        'length': '192 mm',
        'price': '86,697 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/df6b1a3641b0a96940e7e5ce77685bad.1600.jpg'
      },
      {
        'model': 'XFX Speedster MERC 310 Black Edition',
        'vram': '24 GB',
        'base_clock': '2300 MHz',
        'boost_clock': '2615 MHz',
        'color': 'Black/Silver',
        'length': '344 mm',
        'price': '252,296 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/4b6e1666bdde2d084cb87b98ba5d8b30.1600.jpg'
      },
      {
        'model': 'MSI RTX 4070 Ti SUPER 16G VENTUS 3X',
        'vram': '16 GB',
        'base_clock': '2340 MHz',
        'boost_clock': '2655 MHz',
        'color': 'Black',
        'length': '322 mm',
        'price': '367,988 PKR',
        'image_url': 'https://m.media-amazon.com/images/I/41EVtr+4tIL.jpg'
      },
      {
        'model': 'MSI VENTUS 2X OC',
        'vram': '12 GB',
        'base_clock': '1980 MHz',
        'boost_clock': '2520 MHz',
        'color': 'Black',
        'length': '242 mm',
        'price': '179,510 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/0a29d4782e8c8663f147adeaa1620966.1600.jpg'
      },
      {
        'model': 'PNY VCNRTX6000ADA-PB',
        'vram': '48 GB',
        'base_clock': '915 MHz',
        'boost_clock': '2505 MHz',
        'color': 'Black/Gold',
        'length': '267 mm',
        'price': '2,104,516 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/6ef5b8f1b94982c71019a0d9ac2795e2.1600.jpg'
      },
      {
        'model': 'Asus DUAL EVO OC',
        'vram': '12 GB',
        'base_clock': '1980 MHz',
        'boost_clock': '2550 MHz',
        'color': 'Black',
        'length': '227 mm',
        'price': '173,996 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/b2e522aaaed5220303baa80de9668e15.1600.jpg'
      },
      {
        'model': 'MSI VENTUS 2X OC',
        'vram': '12 GB',
        'base_clock': '1920 MHz',
        'boost_clock': '2520 MHz',
        'color': 'Silver/Black',
        'length': '242 mm',
        'price': '144,997 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/0a29d4782e8c8663f147adeaa1620966.1600.jpg'
      },
      {
        'model': 'ASRock Challenger',
        'vram': '12 GB',
        'base_clock': '2670 MHz',
        'boost_clock': '2740 MHz',
        'color': 'White/Gray',
        'length': '298 mm',
        'price': 'N/A',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/370f3e820daf59ae47e87c94e296822d.1600.jpg'
      },
      {
        'model': 'Asus ROG STRIX GAMING OC',
        'vram': '24 GB',
        'base_clock': '2235 MHz',
        'boost_clock': '2640 MHz',
        'color': 'White',
        'length': '358 mm',
        'price': '1,073,106 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/2aab4ec16f5be8f6d95d1e5848c2d9be.1600.jpg'
      },
      {
        'model': 'NVIDIA Founders Edition',
        'vram': '24 GB',
        'base_clock': '2230 MHz',
        'boost_clock': '2520 MHz',
        'color': 'Black/Silver',
        'length': '304 mm',
        'price': '970,527 PKR',
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/07ff8dc03a65e34edc811c97d838af9a.1600.jpg'
      }
    ];

    for (var gpu in gpuData) {
      await _gpuRef.push().set(gpu);
    }
  }
}
