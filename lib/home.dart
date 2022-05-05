import 'package:flutter/material.dart';
import 'package:loginuicolors/mapSample.dart';
import 'package:loginuicolors/navbar.dart';
// import 'NavBar.dart';
import 'package:loginuicolors/navbar.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Custom Functions

  //1. custom card function
  Card makeDashBoardItems(String title, String img, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(3.0, -1.0),
              colors: [
                Color(0xFF00488D),
                Color(0xFFFFFFFF),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 3,
                offset: Offset(2, 2),
              )
            ]),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              //1. PROFILE
              Navigator.pushNamed(context, "/profile");
            }
            if (index == 1) {
              //2. MAP
              Navigator.pushNamed(context, "/map");
            }
            if (index == 2) {
              //3. Donate Blood

              //activating function on `Donate Blood` click
              donateBloodFunc_popupDialog();
            }
            if (index == 3) {
              //4. Request Blood
            }
            if (index == 4) {
              //5. All Requests :-> Currently making it inactive
            }
            if (index == 5) {
              //6. Logout
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  img,
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //2. blood donation popup dialog
  donateBloodFunc_popupDialog() {
    showDialog(
        // barrierColor: Color.fromARGB(255, 244, 174, 153),
        context: context,
        builder: (context) {
          return Dialog(
            // insetPadding: EdgeInsets.all(4.0),
            shape:
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), 
                  // side: BorderSide(width: 40)
                ),
            elevation: 16,
            child: Container(
              // margin: EdgeInsets.only(
              //   left: 20,              
              // ),
                  // top: MediaQuery.of(context).size.height * 0.5),
            color: Color.fromARGB(
                  255, 244, 174, 153), //Color.fromARGB(255, 244, 78, 44),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // SizedBox(height: 20),
                  Center(
                      child: Text(
                        'Do you really want to Donate Blood?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                  )),
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 2, 37, 52),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {
                          print('hello');
                        },
                        icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // _buildRow('assets/choc.png', 'Name 1', 1000),
                  // _buildRow('assets/choc.png', 'Name 2', 2000),
                  // _buildRow('assets/choc.png', 'Name 3', 3000),
                  // _buildRow('assets/choc.png', 'Name 4', 4000),
                  // _buildRow('assets/choc.png', 'Name 5', 5000),
                  // _buildRow('assets/choc.png', 'Name 6', 6000),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white12,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rakta"),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromARGB(255, 224, 119, 119),

      //not sure whether we will use this or not.
      drawer: Drawer(),

      body: Column(
        children: [
          // const SizedBox(
          //   height: 100,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 16, right: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Flutter Grid DashBoard',
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //           SizedBox(
          //             height: 4,
          //           ),
          //           Text(
          //             'Items',
          //             style: TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(2),
            children: [
              //index 0
              makeDashBoardItems(
                  // "Calender", "assets/thirdParty/calendar.png", 0),
                  "Profile",
                  "assets/images/profile_logImg128.png",
                  0),
              //index 1
              makeDashBoardItems(
                  // "Festival", "assets/thirdParty/festival.png", 1),
                  "Map",
                  "assets/thirdParty/map.png",
                  1),
              //index 2
              makeDashBoardItems(
                  "Donate Blood", "assets/images/blood_donateLogo128.png", 2),
              //index 3
              makeDashBoardItems("Request Blood",
                  "assets/images/blood_requestImg2_128.png", 3),
              //index 4
              //NOT sure what logo should we put
              makeDashBoardItems(
                  "All Requests", "assets/thirdParty/todo.png", 4),
              //index 5
              makeDashBoardItems(
                  "Logout", "assets/images/logoutLogo128.png", 5),
            ],
          ))
        ],
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     title: Text(
    //       "RAKTA",
    //       style: TextStyle(fontFamily: 'RobotoMono'),
    //     ),
    //     backgroundColor: Color.fromARGB(213, 242, 11, 11),
    //     actions: [
    //       Stack(
    //         children: [
    //           IconButton(
    //               onPressed: () {
    //                 // Navigator.push(context,
    //                 //     MaterialPageRoute(builder: (context) => MapSample()));
    //               },
    //               icon: Icon(Icons.notifications)),
    //           Positioned(
    //               top: 0,
    //               right: 0,
    //               child: Container(
    //                 alignment: Alignment.center,
    //                 padding: EdgeInsets.all(0),
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   shape: BoxShape.circle,
    //                 ),
    //               ))
    //         ],
    //       )
    //     ],
    //   ),

    //   //Navigation Bar
    //   drawer: NavBar(),

    //   //body of the page
    //   // body: Center(
    //   //     child: ElevatedButton.icon(
    //   //       onPressed: () {
    //   //           // Navigator.pop(context);
    //   //           Navigator.push(context,
    //   //               MaterialPageRoute(builder: (context) => MapSample()));
    //   //       },
    //   //       icon: Icon(Icons.map_rounded),
    //   //       label: Text('Go')
    //   //     )
    //   // ),

    //   body: ,

    // );
  }
}

Widget _buildRow(String imageAsset, String name, double score) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        SizedBox(height: 12),
        Container(height: 2, color: Colors.redAccent),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(imageAsset)),
            SizedBox(width: 12),
            Text(name),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow[900],
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text('$score'),
            ),
          ],
        ),
      ],
    ),
  );
}
