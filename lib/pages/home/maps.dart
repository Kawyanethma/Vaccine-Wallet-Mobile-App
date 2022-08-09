import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);
  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng showLocation = LatLng(6.92781026181, 79.849936266); 

 @override
  void initState() {
      markers.add(Marker( //add marker on google map
          markerId: MarkerId(showLocation.toString()),
          position: showLocation, //position of marker
          infoWindow: InfoWindow( //popup info 
            title: 'My Custom Title ',
            snippet: 'My Custom Subtitle',
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //you can add more markers here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Navigator.pop(context,true),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            );
          }),
        ),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0.1, vertical: 1),
          child: Column(children: [
            Row(children: const [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.9, vertical: 30),
                  child: Text('Map',
                  style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
               ),
              ),
            ],),
            const SizedBox(height: 20),
            //card
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: 400,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0,vertical: 9.0),
                  child: GoogleMap( //Map widget from google_maps_flutter package,
                      zoomGesturesEnabled: true, //enable Zoom in, out on map
                      initialCameraPosition: CameraPosition( //innital position in map
                        target: showLocation, //initial position
                        zoom: 15.0, //initial zoom level
                      ),
                      markers: markers, //markers to show on map
                      mapType: MapType.normal, //map type
                      onMapCreated: (controller) {//method called when map is created
                        setState(() {
                          mapController = controller; 
                        });
                      },
                              ),
                ),
              ),
            ),
          ]),
      ),
      ),
    );
  }
}
