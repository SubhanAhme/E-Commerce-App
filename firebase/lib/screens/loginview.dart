import 'package:firebase/screens/signupview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addproduct.dart';
import 'homeview.dart';
// class LoginView extends StatelessWidget {
//   LoginView({super.key});
//   TextEditingController email_control = TextEditingController();
//   TextEditingController pass_control = TextEditingController();
//   @override
//   login(context) async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email_control.text, password: pass_control.text);
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => const HomeView(),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             "Login",
//             style: TextStyle(fontSize: 35),
//           ),
//           TextField(
//             controller: email_control,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Email',
//             ),
//           ),
//           TextField(
//             controller: pass_control,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Password',
//             ),
//           ),
//           GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => SignupView()));
//               },
//               child: Text("Did not have account Signup?")),
//           ElevatedButton(
//               onPressed: () {
//                 login(context);
//               },
//               child: Text("Login"))
//         ],
//       ),
//     );
//   }
// }

class LoginView extends StatelessWidget {
   LoginView({super.key});

   TextEditingController email_control = TextEditingController();
  TextEditingController pass_control = TextEditingController();

  @override
    login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email_control.text,
          password: pass_control.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 69, 121, 71),
      ),
        body: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
        //   Container(
        //     padding: EdgeInsets.only(top:50,left:80,right: 80),
            
        // child: Image(image: AssetImage("assets/logo.png")),
      
        //   ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 300,
                right: 35,
                left: 35,
              ),
              child: Column(
                children: [
                  TextField(
                      controller: email_control,
                   
                    decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: pass_control,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => {
                         
                        
                          },
                        child: Text(
                          "Sign IN",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 69, 121, 71),
                          ),
                        ),
                      ),
                      CircleAvatar(
                       
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 69, 121, 71),
                        child: IconButton(
                          
                          onPressed: () => {
                             login(context),
                            Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddProductView()),)

                          },
                          icon: Icon(Icons.arrow_forward),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                         
                      onPressed: (){},
                          child: Text(
                            "sign up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 17,
                              color: Color.fromARGB(255, 69, 121, 71),
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "forgot password",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 17,
                              color: Color.fromARGB(255, 69, 121, 71),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
