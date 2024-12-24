import 'package:firebase_database/firebase_database.dart';

class FirebaseHelperPowerSupply {
  final DatabaseReference _powerSupplyRef = FirebaseDatabase.instance.ref('power_supplies'); // Reference to 'power_supplies' node

  // Function to add Power Supply data to Firebase manually
  Future<void> addPowerSupplyDataManually() async {
    // All the Power Supply data to upload
    final powerSupplyData = [
      {
        'name': 'Corsair RM750e',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '750 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 28970,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/336c7955df0312d04655dd3a13973c95.1600.jpg'
      },
      {
        'name': 'Corsair RM850e',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 31890,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/74e6caafd69bcc53d6e5060a3249248d.1600.jpg'
      },
      {
        'name': 'Corsair RM1000e',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '1000 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 43470,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/ce27e414f67e9e8786401e4260bb85fa.1600.jpg'
      },
      {
        'name': 'Corsair RM650',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '650 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 23170,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/4c2a36634803871ec36077cba6cbac4f.1600.jpg'
      },
      {
        'name': 'MSI MAG A750GL PCIE5',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '750 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 26070,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/d8f4d13ba49891eb3929bdddc3d87b4b.1600.jpg'
      },
      {
        'name': 'MSI MAG A650BN',
        'type': 'ATX',
        'certification': '80+ Bronze',
        'wattage': '650 W',
        'modular': 'No',
        'color': 'Black',
        'price_pkr': 20300,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/3148f884b77b2d7abee3a3e0ad72cf73.1600.jpg'
      },
      {
        'name': 'MSI MAG A850GL PCIE5',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 31890,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/79be60ce3783b8918a1c0940d3e4ff19.1600.jpg'
      },
      {
        'name': 'MSI MAG A550BN',
        'type': 'ATX',
        'certification': '80+ Bronze',
        'wattage': '550 W',
        'modular': 'No',
        'color': 'Black',
        'price_pkr': 17070,
        'image_url': 'https://m.media-amazon.com/images/I/51VZJ8DVX-L.jpg'
      },
      {
        'name': 'Corsair RM850x',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 35100,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/4f19c6453ce4ebe67091e6d9735f3a19.1600.jpg'
      },
      {
        'name': 'Seasonic Focus GX-850',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 29000,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/923d08dddeefd9976e03c76d149efb01.1600.jpg'
      },
      {
        'name': 'Thermaltake Toughpower GF1 850W',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 29000,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/1d3c099db66ec0e9f5a65298b5aa5b96.1600.jpg'
      },
      {
        'name': 'Cooler Master MWE Gold 850W',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 31500,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/01c5294aaa030cd889e3923906b92a10.1600.jpg'
      },
      {
        'name': 'EVGA SuperNOVA 850 G5',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 34000,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/ce5dff864e7aa7518219eb59eb2616c6.1600.jpg'
      },
      {
        'name': 'Gigabyte P850GM',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 28000,
        'image_url': 'https://m.media-amazon.com/images/I/41fF-4VeSsL.jpg'
      },
      {
        'name': 'Corsair HX1200i',
        'type': 'ATX',
        'certification': '80+ Platinum',
        'wattage': '1200 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 52680,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/cdf0213f62ccdb8c0d239d809eca0762.1600.jpg'
      },
      {
        'name': 'Seasonic PRIME TX-1000',
        'type': 'ATX',
        'certification': '80+ Titanium',
        'wattage': '1000 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 65000,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/84b3aab42651adcad9a0b05ac262ea53.1600.jpg'
      },
      {
        'name': 'Cooler Master V Gold 1000W',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '1000 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 38000,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/92422ff04d9868a7258467ad9797f6ba.1600.jpg'
      },
      {
        'name': 'Corsair RM850',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 30420,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/1e3308cded9a7c92a8dba6b2be976bcc.1600.jpg'
      },
      {
        'name': 'Corsair RM1000x',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '1000 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 43470,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/8bc2cb01b2a5875aa983b4cc5be68221.1600.jpg'
      },
      {
        'name': 'Corsair AX1600i',
        'type': 'ATX',
        'certification': '80+ Titanium',
        'wattage': '1600 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 162430,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/1d57cf53a1289e4dfff1aed9b1cc272a.1600.jpg'
      },
      {
        'name': 'Corsair SF1000',
        'type': 'SFX',
        'certification': '80+ Platinum',
        'wattage': '1000 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 66670,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/0dd4e1eecc238b78a3b4abfa14af9d50.1600.jpg'
      },
      {
        'name': 'Corsair HX1500i',
        'type': 'ATX',
        'certification': '80+ Platinum',
        'wattage': '1500 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 95620,
        'image_url': 'https://m.media-amazon.com/images/I/51KR9mokksL.jpg'
      },
      {
        'name': 'Corsair RM750x',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '750 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 40590,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/1b188238912bad1b60bbfef7d8912470.1600.jpg'
      },
      {
        'name': 'Thermaltake Smart',
        'type': 'ATX',
        'certification': '80+',
        'wattage': '500 W',
        'modular': 'No',
        'color': 'Black',
        'price_pkr': 11580,
        'image_url': 'https://m.media-amazon.com/images/I/519RlzaoKDL.jpg'
      },
      {
        'name': 'Corsair SF850',
        'type': 'SFX',
        'certification': '80+ Platinum',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 58170,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/016556184725a9604ae50e789f12b12c.1600.jpg'
      },
      {
        'name': 'be quiet! Pure Power 12 M',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 33340,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/58f82e34238ad2132a69775300daa503.1600.jpg'
      },
      {
        'name': 'be quiet! Dark Power 13',
        'type': 'ATX',
        'certification': '80+ Titanium',
        'wattage': '1000 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 69470,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/02078adf4372cab46e72fc7dc8ff4553.1600.jpg'
      },
      {
        'name': 'NZXT C850',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '850 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 31980,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/c0060ae80a7b71686da1ca92324d0f68.1600.jpg'
      },
      {
        'name': 'NZXT C750',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '750 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 29900,
        'image_url': 'https://m.media-amazon.com/images/I/41G2GcCov2L.jpg'
      },
      {
        'name': 'Antec Earthwatts Gold Pro 750W',
        'type': 'ATX',
        'certification': '80+ Gold',
        'wattage': '750 W',
        'modular': 'Full',
        'color': 'Black',
        'price_pkr': 30500,
        'image_url': 'https://m.media-amazon.com/images/I/41fF-4VeSsL.jpg'
      }
    ];

    for (var item in powerSupplyData) {
      final newPowerSupplyRef = _powerSupplyRef.push();
      await newPowerSupplyRef.set(item);
    }
  }
}
