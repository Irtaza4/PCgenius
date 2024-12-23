import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pc_genius/FirebaseServices/firebase_helper_motherboards.dart';
import 'package:pc_genius/FirebaseServices/firebase_helper_processors.dart';
import 'package:pc_genius/ui/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pc_genius/ui/splash_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseHelperProcessors firebaseHelper = FirebaseHelperProcessors();
  final FirebaseHelperMotherboards firebaseHelperMotherboards = FirebaseHelperMotherboards();


  // Add processor data manually when app starts
  //firebaseHelper.addProcessorDataManually();
  //firebaseHelperMotherboards.addMotherboardDataManually();
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
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen()
    );
  }
}

