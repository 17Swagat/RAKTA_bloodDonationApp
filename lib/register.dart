// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginuicolors/home.dart';

// Gloal registeration boolean value
bool registerationSucccess = false;

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  // // CollectionReference users = FirebaseFirestore.instance
  //     .collection("usersfilledInfo_duringRegisteration");
  CollectionReference users = FirebaseFirestore.instance
      .collection("usersfilledInfo_duringRegisteration");

  //Text editing controller
  TextEditingController userNameTEC = TextEditingController();
  TextEditingController userPhoneNumberTEC = TextEditingController();
  TextEditingController userAgeTEC = TextEditingController();
  TextEditingController userBloodGroupTEC = TextEditingController();
  TextEditingController userCityTownTEC = TextEditingController();
  TextEditingController userPincodeTEC = TextEditingController();
  TextEditingController userEmailTEC = TextEditingController();
  TextEditingController userPasswordTEC = TextEditingController();

  //functions

  firebasemangingFunction() async {
    var storeName = userEmailTEC.text;
    var storePassword = userPasswordTEC.text;
    var storeEmail = userEmailTEC.text;
    var storePhoneNumber = userPhoneNumberTEC.text;
    var storeAge = userAgeTEC.text;
    var storeCityTown = userCityTownTEC.text;
    var storeBloodGroup = userBloodGroupTEC.text;
    var storePincode = userPincodeTEC.text;

    //code to store the above data on the firebase on the button click
    //and then going to the home page

    // FIREBASE AUTHH
    /** */
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: storeEmail,
            password: storePassword,
          )
          .then((value) => () {
                print("Successfully created new account!!");
                registerationSucccess = true;
                Navigator.pushNamed(context, "/home");
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    // FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(
    //         email: storeEmail, password: storePassword)
    //     .then((value) => () {
    //           print("successfully created new account!!");
    //           registerationSucccess = true;
    //           // Navigator.pushNamedAndRemoveUntil(
    //           //     context, "/home", (route) => false);

    //           Navigator.pushNamed(context, "/home");
    //           // Navigator.push(
    //           //     context,
    //           //     MaterialPageRoute(
    //           //         builder: (context) =>
    //           //             Home()));

    //           // Navigator.of(context).pushNamed('/home');
    //           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    //         })
    //     .onError((error, stackTrace) => () {
    //           print("error ${error.toString()}");
    //         });



    //store data in the firestore
    await users.add({
      'Name': storeName,
      'Age': storeAge,
      'Blood Group': storeBloodGroup,
      'Email': storeEmail,
      'Mobile Number': storePhoneNumber,
      'Password': storePassword,
      'Pin number': storePincode,
    }).then((value) => () {
          print("user added to the database");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/my_login_graphics.jpg'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: Text('Register'),
        //   backgroundColor: Colors.redAccent, // Colors.transparent,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 120, top: 30),
                child: Text(
                  'Create\nAccount',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Username",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              controller: userNameTEC,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              controller: userPasswordTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.emailAddress,
                              controller: userEmailTEC,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Mobile No",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.phone,
                              controller: userPhoneNumberTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Blood Group (O-, B+, A+, etc )",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              controller: userBloodGroupTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Age",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.number,
                              controller: userAgeTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "City/Town",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              controller: userCityTownTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Pin No",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              keyboardType: TextInputType.number,
                              controller: userPincodeTEC,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      firebasemangingFunction();
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  // if (registerationSucccess) {
                                  Navigator.pushNamed(context, "/home");
                                  // }
                                },
                                child: Text(
                                  'Home',
                                  style: TextStyle(color: Colors.redAccent),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Text(
                                    'Sign In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                        fontSize: 25),
                                  ),
                                  style: ButtonStyle(),
                                ),
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
          ),
        ),
      ),
    );
  }
}
