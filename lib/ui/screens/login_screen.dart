import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pc_genius/ui/screens/home_screen.dart';
import 'package:pc_genius/ui/screens/signup_screen.dart';

import '../../Utils/utils.dart';
import '../../Widgets/round_button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
  void login(){
    setState(() {
      loading =true;
    });
    _auth.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text).then((value){
      Utilas().toastMessage('Login Successfully!');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      setState(() {
        loading =false;
      });
    }).onError((error,stackTrace){
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading =false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Login',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.transparent, // Make the default background transparent
          flexibleSpace: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,  // Start at the top-left
          end: Alignment.bottomRight,  // End at the bottom-right
          colors: [Colors.black, Colors.green],
        ),
          ),),),
        body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: Image.asset('assets/images/1.jpeg',
                          height: 250,
                          width: 250,),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Email',
                                helperText: 'Enter email e.g jon@gmail.com' ,
                                prefixIcon: Icon(Icons.alternate_email,color: Colors.white,)),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter Email';
                              }
                              return null;
                            }
            
            
            
            
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                            controller: passwordcontroller,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
            
                                hintText: 'Password',
            
                                helperText: 'Enter your password' ,
                                prefixIcon: Icon(Icons.lock_open_outlined,color: Colors.white,)),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter Password';
                              }
                              return null;
                            }
                        ),
            
                      ],
                    )),
                SizedBox(height: 50,),
            
                RoundButton(title: 'Login',
                  loading: loading,
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      login();
                    }
                  },),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: TextStyle(color: Colors.white), ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                    }, child: Text('Sign up',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w900),))
                  ],
                ),
                SizedBox(height: 50),
            
              ],
            ),
          ),
        ),
      );

  }
}