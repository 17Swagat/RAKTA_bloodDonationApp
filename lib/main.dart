import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginuicolors/guestOrNot.dart';
import 'package:loginuicolors/home.dart';
import 'package:loginuicolors/login.dart';
import 'package:loginuicolors/profilePage.dart';
import 'package:loginuicolors/trialExperimentation_mapPage.dart';
// import 'package:loginuicolors/mapPage.dart';
import 'mapSample.dart';
import 'package:loginuicolors/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    // home: MyLogin(),
    initialRoute: '/home',//'/map',
    routes: {
      '/': (context) => MyLogin(),
      // '/': (context) => MapSample(),//MapPage(),
      '/home': (context) => Home(),
      '/register': (context) => MyRegister(),
      '/login': (context) => MyLogin(),
      '/guest': (context) => GuestOrNotPage(),
      '/map': (context) => TrialExpMapPage(),//MapSample(),
      '/profile': (context) => ProfilePage(),
    },
  ));
}
