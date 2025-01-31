import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pc_genius/ui/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final FirebaseHelperProcessors firebaseHelper = FirebaseHelperProcessors();
  // final FirebaseHelperMotherboards firebaseHelperMotherboards =
  //     FirebaseHelperMotherboards();
  // final FirebaseHelperRAM firebaseHelperRAM = FirebaseHelperRAM();
  // final FirebaseHelperGPU firebaseHelperGPU = FirebaseHelperGPU();
  // final FirebaseHelperPowerSupply firebaseHelperPowerSupply =
  //     FirebaseHelperPowerSupply();
  // final FirebaseHelperCase firebaseHelperCase = FirebaseHelperCase();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
