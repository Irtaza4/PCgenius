import 'package:firebase_database/firebase_database.dart';

class FirebaseHelperCase {
  final DatabaseReference _caseRef = FirebaseDatabase.instance.ref('cases'); // Reference to 'cases' node

  // Function to add Case data to Firebase manually
  Future<void> addCaseDataManually() async {
    // All the case data to upload
    final caseData = [
      {
        'name': 'Corsair 4000D Airflow',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tinted Tempered Glass',
        'volume': 48.6,
        'internal_bays': 2,
        'price_pkr': 22999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/bc6e987da3fe22c616898d1d7fa3d227.1600.jpg'
      },
      {
        'name': 'NZXT H5 Flow (2022)',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 47.0,
        'internal_bays': 1,
        'price_pkr': 19999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/84cb77175187296029f50f8bf6ca6960.1600.jpg'
      },
      {
        'name': 'Montech XR',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 45.0,
        'internal_bays': 2,
        'price_pkr': 9999,
        'image_url': 'https://m.media-amazon.com/images/I/41EQBUlNKML.jpg'
      },
      {
        'name': 'Cooler Master MasterBox Q300L',
        'type': 'Micro ATX',
        'color': 'Black',
        'side_panel': 'Acrylic',
        'volume': 31.0,
        'internal_bays': 3,
        'price_pkr': 11900,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/ec48e16ee4d6629045cfc4d71c649746.1600.jpg'
      },
      {
        'name': 'Fractal Design Meshify C',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 46.0,
        'internal_bays': 3,
        'price_pkr': 16999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/5e077c6b1272ca2c11e4f7df6326370a.1600.jpg'
      },
      {
        'name': 'NZXT H9 Flow',
        'type': 'ATX Mid Tower',
        'color': 'White',
        'side_panel': 'Tempered Glass',
        'volume': 66.9,
        'internal_bays': 2,
        'price_pkr': 41999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/61eb5534e35ce8af07f25ff28197862b.1600.jpg'
      },
      {
        'name': 'NZXT H9 Flow',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 66.9,
        'internal_bays': 2,
        'price_pkr': 41999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/15fb785fb4d0995e7cc7e28a6f2271d9.1600.jpg'
      },
      {
        'name': 'Montech AIR 903 MAX',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 47.6,
        'internal_bays': 3,
        'price_pkr': 13999,
        'image_url': 'https://m.media-amazon.com/images/I/519WrOWiOhL.jpg'
      },
      {
        'name': 'Cooler Master MasterBox E500L',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 47.8,
        'internal_bays': 3,
        'price_pkr': 12900,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/ec48e16ee4d6629045cfc4d71c649746.1600.jpg'
      },
      {
        'name': 'Lian Li PC-O11 Dynamic',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 71.5,
        'internal_bays': 4,
        'price_pkr': 18999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/580387945cfb3fe6bac9ef5844c2b55f.1600.jpg'
      },
      {
        'name': 'Thermaltake V200',
        'type': 'ATX Mid Tower',
        'color': 'White',
        'side_panel': 'Tempered Glass',
        'volume': 39.0,
        'internal_bays': 3,
        'price_pkr': 10900,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/61648b636fa64af0a730d0195031465f.1600.jpg'
      },
      {
        'name': 'Fractal Design Define 7',
        'type': 'Full Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 68.0,
        'internal_bays': 4,
        'price_pkr': 21999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/3803ebb09f64ddc954a86cb7b45a8ebd.1600.jpg'
      },
      {
        'name': 'Cooler Master HAF 700 EVO',
        'type': 'Full Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 82.0,
        'internal_bays': 6,
        'price_pkr': 30999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/d31150b26d756cc5e2221e63f264e8d6.1600.jpg'
      },
      {
        'name': 'Phanteks Eclipse P360A',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 46.3,
        'internal_bays': 4,
        'price_pkr': 14999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/4beb27272519c97f098ceab48df1e12c.1600.jpg'
      },
      {
        'name': 'SilverStone Fara R1',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 40.5,
        'internal_bays': 3,
        'price_pkr': 11999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/4ff42fa090d41392739d099e28baf56f.1600.jpg'
      },
      {
        'name': 'Antec NX410',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 42.3,
        'internal_bays': 4,
        'price_pkr': 10900,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/881b5d3048a3e6c614c565698022feb6.1600.jpg'
      },
      {
        'name': 'Gigabyte AORUS C300G',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 47.2,
        'internal_bays': 3,
        'price_pkr': 15999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/b4eee8314bb582edeb59eef06376bf4c.1600.jpg'
      },
      {
        'name': 'Corsair iCUE 4000X RGB',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 47.0,
        'internal_bays': 3,
        'price_pkr': 19999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/0610d363ccccf52837f07d811e4eb2a3.1600.jpg'
      },
      {
        'name': 'Thermaltake Level 20 MT ARGB',
        'type': 'ATX Mid Tower',
        'color': 'White',
        'side_panel': 'Tempered Glass',
        'volume': 47.6,
        'internal_bays': 3,
        'price_pkr': 17999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/61648b636fa64af0a730d0195031465f.1600.jpg'
      },
      {
        'name': 'DeepCool MATREXX 50',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 43.8,
        'internal_bays': 3,
        'price_pkr': 10900,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/8fdb4c1dc378c0c163d5f29037da4dbe.1600.jpg'
      },
      {
        'name': 'Fractal Design Define 7 Compact',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 49.6,
        'internal_bays': 4,
        'price_pkr': 18999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/3803ebb09f64ddc954a86cb7b45a8ebd.1600.jpg'
      },
      {
        'name': 'Phanteks P400A',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 45.0,
        'internal_bays': 3,
        'price_pkr': 12999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/b799e3113602fc415370943709415190.1600.jpg'
      },
      {
        'name': 'Cooler Master MasterBox K500',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 42.0,
        'internal_bays': 3,
        'price_pkr': 14900,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/bf0023fb357f037c354139e56a95aa4d.1600.jpg'
      },
      {
        'name': 'MSI MAG Forge 100M',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 44.2,
        'internal_bays': 3,
        'price_pkr': 21900,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/4145e426378c801cc80da05d9ec6e8bf.1600.jpg'
      },
      {
        'name': 'DeepCool Game Storm',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 46.5,
        'internal_bays': 3,
        'price_pkr': 13999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/b4eee8314bb582edeb59eef06376bf4c.1600.jpg'
      },
      {
        'name': 'Zalman ZM-T4',
        'type': 'Mini ATX Tower',
        'color': 'Black',
        'side_panel': 'Acrylic',
        'volume': 28.5,
        'internal_bays': 2,
        'price_pkr': 7999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/e55cd4d5e340ed49b1f0ac2f16bde6d0.1600.jpg'
      },
      {
        'name': 'Antec DF700 FLUX',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 46.8,
        'internal_bays': 4,
        'price_pkr': 16999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/881b5d3048a3e6c614c565698022feb6.1600.jpg'
      },
      {
        'name': 'InWin 303C',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 44.9,
        'internal_bays': 3,
        'price_pkr': 15999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/71a5af072d1ec085a7f8efc90cc895ba.1600.jpg'
      },
      {
        'name': 'Sharkoon TG5',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 45.4,
        'internal_bays': 3,
        'price_pkr': 13999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/fa0752303b39c0affe2244992c585515.1600.jpg'
      },
      {
        'name': 'Gigabyte GZ-Z2',
        'type': 'ATX Mid Tower',
        'color': 'Black',
        'side_panel': 'Acrylic',
        'volume': 40.5,
        'internal_bays': 3,
        'price_pkr': 7999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/87dbfe1f1a567098dfe4b3754488f9f9.1600.jpg'
      },
      {
        'name': 'Cooler Master MasterBox Q500L',
        'type': 'Micro ATX',
        'color': 'Black',
        'side_panel': 'Acrylic',
        'volume': 34.3,
        'internal_bays': 3,
        'price_pkr': 11900,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/23cfe7e7da91b76450f98e6b4af308d4.1600.jpg'
      },
      {
        'name': 'Lian Li PC-011XL',
        'type': 'Full Tower',
        'color': 'Black',
        'side_panel': 'Tempered Glass',
        'volume': 95.0,
        'internal_bays': 4,
        'price_pkr': 29999,
        'image_url': 'https://cdna.pcpartpicker.com/static/forever/images/product/580387945cfb3fe6bac9ef5844c2b55f.1600.jpg'
      }
    ];

    // Uploading all case data to Firebase
    for (var caseItem in caseData) {
      await _caseRef.push().set(caseItem);
    }
  }
}
