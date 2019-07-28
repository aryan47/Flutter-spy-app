import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  List<Marker> markers = [];
  GoogleMapController mapController;
  @override
  void initState() {
    super.initState();
    markers.add(Marker(
      markerId: MarkerId('loc'),
      draggable: false,
      position: LatLng(45.521563, -122.677433),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: ListTile(
                leading: Icon(Icons.verified_user),
                  title: Text(
                "Welcome Ritesh",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )),
              decoration: BoxDecoration(color: Colors.green),
            ),
            ListTile(
              leading: Icon(Icons.assistant),
              title: Text("Ask Assistant"),
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            _getMap(),
            _getDrawer(),
            _getAppBar(),
            _getHorizontalList(),
          ],
        ),
      ),
    );
  }

  Widget _getMap() {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      initialCameraPosition:
          CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 11.0),
      markers: Set.of(markers),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }

  Widget _getDrawer() {
    return Builder(builder: (context) {
      return Positioned(
        top: 30.0,
        left: 30.0,
        child: IconButton(
          color: Colors.green,
          iconSize: 30.0,
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      );
    });
  }

  Widget _getHorizontalList() {
    return Positioned(
        bottom: 0.0,
        left: 2.0,
        child: Container(
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            padding: EdgeInsets.all(5.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _getBottomCard(),
              _getBottomCard(),
              _getBottomCard(),
            ],
          ),
        )
        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: [1,2,3].length,
        //   itemBuilder: (build, index){
        //     return ListTile(
        //       leading: Text('Hello'),
        //     );
        //   },
        // ),
        );
  }

  Widget _getAppBar() {
    return Positioned(
      top: 50.0,
      right: 10.0,
      child: InkWell(
        child: Card(
          color: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
              alignment: Alignment.center,
              height: 26.0,
              width: 150.0,
              child: Text(
                "Chat with assistant",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }

  Widget _getBottomCard() {
    return InkWell(
      splashColor: Colors.green,
      child: Container(
        color: Colors.green[1500],
        width: 250.0,
        child: Card(
          color: Colors.greenAccent[100],
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Ritesh Kant",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(),
                Text("Last Address:")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
