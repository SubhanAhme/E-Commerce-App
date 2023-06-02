import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginview.dart';

class SignUPView extends StatelessWidget {
   SignUPView({super.key});

  TextEditingController semail_control = TextEditingController();
  TextEditingController spass_control = TextEditingController();
  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: semail_control.text,
        password: spass_control.text,
      );
      print("User Addes Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: Scaffold(
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
                  //  TextField(
                  //   controller: sname_control,
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //       fillColor: Colors.white30,
                  //       filled: true,
                  //       hintText: "Name",
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10))),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  TextField(
                    controller: semail_control,
                   
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
                    controller: spass_control,
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
                        onPressed: () {},
                        child: Text(
                          "Sign UP",
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
                          signup(context),
                          Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginView()),)

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

                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

// class SignupView extends StatelessWidget {
//   SignupView({super.key});
//   TextEditingController semail_control = TextEditingController();
//   TextEditingController spass_control = TextEditingController();
//   signup(context) async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: semail_control.text,
//         password: spass_control.text,
//       );
//       print("User Addes Successfully");
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             "SignUp",
//             style: TextStyle(fontSize: 35),
//           ),
//           TextField(
//             controller: semail_control,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Email',
//             ),
//           ),
//           TextField(
//             controller: spass_control,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Password',
//             ),
//           ),
//           GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => LoginView()));
//               },
//               child: Text("back")),
//           ElevatedButton(
//               onPressed: () {
//                 signup(context);
//               },
//               child: Text("signup"))
//         ],
//       ),
//     );
//   }
// }
