import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:loginuicolors/loginScreen.dart';
// import "home.dart";
import "forgotpass.dart";
import "home.dart";

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {


  // Firebase initialization
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/my_login_graphics.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return LoginScreen();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

        //**************** */
        /*Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 75, top: 130),
              child: Text(
                'Blood Donation',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "User Email",
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.blueAccent,
                                )),
                          ),
                          // TextField(
                          //   style: TextStyle(color: Colors.black),
                          //   decoration: InputDecoration(
                          //       fillColor: Colors.grey.shade100,
                          //       filled: true,
                          //       hintText: "Email",
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       )),
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "User Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          // TextField(
                          //   style: TextStyle(),
                          //   obscureText: true,
                          //   decoration: InputDecoration(
                          //       fillColor: Colors.grey.shade100,
                          //       filled: true,
                          //       hintText: "Password",
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       )),
                          // ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                      //
                                      // Navigator.pushNamed(context, 'forgotpass');
                                    }, //*********** */
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                forgotpass()));
                                    // Navigator.pushNamed(
                                    //     context, 'forgotpass');
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}
