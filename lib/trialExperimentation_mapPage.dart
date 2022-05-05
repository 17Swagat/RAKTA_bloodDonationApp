// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class TrialExpMapPage extends StatefulWidget {
//   const TrialExpMapPage({Key? key}) : super(key: key);

//   @override
//   State<TrialExpMapPage> createState() => _TrialExpMapPageState();
// }

// class _TrialExpMapPageState extends State<TrialExpMapPage> {
//   bool mapToggle = false;
//   var currentLocation;
//   GoogleMapController mapController;

//   void initState() {
//     super.initState();
//     Geolocator.getCurrentPosition().then((currentloc) => () {
//           setState(() {
//             currentLocation = currentloc;
//             mapToggle = true;
//           });
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Rakta"),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               //Will contain the map
//               Container(
//                 height: MediaQuery.of(context).size.height - 80,
//                 width: double.infinity,
//                 child: mapToggle
//                     ? GoogleMap(
//                         onMapCreated: onMapCreated,
//                         options: GoogleMapOption
//                       )
//                     : Center(
//                         child: Text(
//                           'Map Loading Please Wait',
//                           style: TextStyle(fontSize: 20.0),
//                         ),
//                       ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   void onMapCreated(controller) {
//     setState(() {
//       mapController = controller;
//     });
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrialExpMapPage extends StatefulWidget {
  const TrialExpMapPage({Key? key}) : super(key: key);

  @override
  State<TrialExpMapPage> createState() => _TrialExpMapPageState();
}

class _TrialExpMapPageState extends State<TrialExpMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    // target: LatLng(37.42796133580664, -122.085749655962),
    // target: LatLng(27.4799, 94.9084),
    target: LatLng(27.452501, 94.892029),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  List<Marker> _list = const [
    //m
    Marker(
      markerId: MarkerId('1'),
      // position: LatLng(27.4799, 94.9084), 
      position: LatLng(27.452501, 94.892029),
      infoWindow: InfoWindow(
        title: 'My Location (Manually Set 1)'
      )
    ),

    Marker(
      markerId: MarkerId('2'),
      position: LatLng(27.4799, 94.9084), 
      // position: LatLng(37.452501, 54.892029),
      infoWindow: InfoWindow(
        title: 'My Location (Manually Set 2)'
      )
    ),
  ];

  @override
  void initState() {
    //TODO: implementing initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition: _kGooglePlex,
        ),
      ),
    
       
    );
  }
}
