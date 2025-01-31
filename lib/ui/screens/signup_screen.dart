import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Utils/utils.dart';
import '../../Widgets/round_button.dart';
import 'login_screen.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading =false;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmPasswordController.dispose();
  }
  void login(){
    setState(() {
      loading= true;
    });
    _auth.createUserWithEmailAndPassword(email: emailcontroller.text.toString(),
      password: passwordcontroller.text.toString(),
    ).then((value) {
      setState(() {
        loading=false;
      });
      Utilas().toastMessage('Account Created!');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading= false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: const Text('SignUp',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor:  Colors.transparent, // Make the default background transparent
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,  // Start at the top-left
                end: Alignment.bottomRight,  // End at the bottom-right
                colors: [Colors.black, Colors.green],
              ),
            ),)
      ),
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
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Image.asset('assets/images/1.jpeg',
                          height: 250,
                          width: 250,),
                      ),
                      // SizedBox(height: 10,),
                      TextFormField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)
                              ),
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Email',
                              helperText: 'enter email e.g jon@gmail.com' ,
                              prefixIcon: Icon(Icons.alternate_email,color: Colors.white,)),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter Email';
                            }
                            return null;
                          }
          
          
          
          
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                          controller: passwordcontroller,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
          
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)
                              ),
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Password',
          
                              helperText: 'Enter your password' ,
                              prefixIcon: Icon(Icons.lock_open_rounded,color: Colors.white,)),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter Password';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 20),
                      // Confirm Password field
                      TextFormField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,  // To hide confirm password text
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                          ),
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(

                          ),
                          labelText: 'Confirm Password',

                          hintText: 'Confirm Password',
                          helperText: 'Re-enter your password',

                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm your password';
                          }
                          // Validate that the passwords match
                          if (value != passwordcontroller.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

          
                    ],
                  )),
              const SizedBox(height: 20,),
          
              RoundButton(title: 'Sign Up',
                loading: loading,
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    login();
                  }
                },),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",style: TextStyle(color: Colors.white), ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  }, child: const Text('Login',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w900),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
