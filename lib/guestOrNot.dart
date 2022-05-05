// import 'package:flutter/material.dart';

// class GuestOrNotPage extends StatefulWidget {
//   const GuestOrNotPage({Key? key}) : super(key: key);

//   @override
//   State<GuestOrNotPage> createState() => _GuestOrNotPageState();
// }

// class _GuestOrNotPageState extends State<GuestOrNotPage> {
//   @override
//   Widget build(BuildContext context) {
//     //radio buttons related variables
//     String radioGroupValue = '';

//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/my_login_graphics.jpg'),
//             fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body:
//             //**************** */
//             // /*
//             Stack(
//           children: [
//             Container(),
//             Container(
//               padding: EdgeInsets.only(left: 100, top: 140),
//               child: Text(
//                 'Enter as : ',
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 255, 255, 255), fontSize: 40),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.45),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 65, right: 35, top: 30),
//                       child: SingleChildScrollView(
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             // crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               // Icon(Icons.lightbulb_outline_rounded, size: 50),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text('Blood Donar',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           fontFamily: 'RobotoMono',
//                                           fontWeight: FontWeight.bold,
//                                           color:
//                                               Color.fromARGB(255, 219, 11, 73),
//                                           backgroundColor: Color.fromARGB(
//                                               255, 236, 179, 223))),
//                                   Radio(
//                                       value: 1,
//                                       groupValue: radioGroupValue,
//                                       onChanged: (val) {
//                                         radioGroupValue = val.toString();
//                                         setState(() {

//                                         });
//                                       }),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Blood Requester',
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontFamily: 'RobotoMono',
//                                         fontWeight: FontWeight.bold,
//                                         color: Color.fromARGB(255, 219, 11, 73),
//                                         backgroundColor:
//                                             Color.fromARGB(255, 236, 179, 223)),
//                                   ),
//                                   Radio(
//                                       value: 2,
//                                       groupValue: radioGroupValue,
//                                       onChanged: (val) {
//                                         radioGroupValue = val.toString();
//                                         setState(() {

//                                         });
//                                       }),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text('Guest',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           fontFamily: 'RobotoMono',
//                                           fontWeight: FontWeight.bold,
//                                           color:
//                                               Color.fromARGB(255, 219, 11, 73),
//                                           backgroundColor: Color.fromARGB(
//                                               255, 236, 179, 223))),
//                                   Radio(
//                                       value: 3,
//                                       groupValue: radioGroupValue,
//                                       onChanged: (val) {
//                                         radioGroupValue = val.toString();
//                                         setState(() {

//                                         });
//                                       }),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ), //*/
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class GuestOrNotPage extends StatefulWidget {
  const GuestOrNotPage({Key? key}) : super(key: key);

  @override
  State<GuestOrNotPage> createState() => _GuestOrNotPageState();
}

class _GuestOrNotPageState extends State<GuestOrNotPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/my_login_graphics.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
            //**************** */
            // /*
            Stack(
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
                      margin: EdgeInsets.only(left: 75, right: 35),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/home");
                              },
                              child: Text('Enter as Guest')),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: Text('Enter as Blood Donar')),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: Text('Enter as Blood Requestor')),
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
    );
  }
}
