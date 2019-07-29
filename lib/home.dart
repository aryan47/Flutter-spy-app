import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spy_app/constants.dart';
import 'package:spy_app/details.dart';
import 'package:spy_app/setting_view.dart';

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
                    style: TextStyle(color: Constant.WHITE_COLOR, fontSize: 20.0),
                  )),
              decoration: BoxDecoration(color: Constant.GREEN_COLOR),
            ),
            ListTile(
              leading: Icon(Icons.assistant),
              title: Text("Ask Assistant"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () => Navigator.pushNamed(context, Settings.id),
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
        top: 35.0,
        left: 30.0,
        child: IconButton(
          color: Constant.GREEN_COLOR,
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
          height: 250.0,
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
      top: 45.0,
      right: 10.0,
      child: InkWell(
        child: Card(
          color: Constant.GREEN_COLOR,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
              alignment: Alignment.center,
              height: 30.0,
              width: 150.0,
              child: Text(
                "Chat with assistant",
                style: TextStyle(color: Constant.WHITE_COLOR),
              )),
        ),
      ),
    );
  }

  Widget _getBottomCard() {
    return InkWell(
      child: Container(
        width: 300.0,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          elevation: 3.0,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Ritesh Kant'),
                ),
                ListTile(
                  leading: Icon(Icons.location_on,color: Constant.GREEN_COLOR,),
                  title: Text(
                      '2nd Avenue, Teachers Colony, 6th Main, Koramangala, Bangalore'),
                ),
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minWidth: 200.0,
                  child: RaisedButton(
                    color: Constant.GREEN_COLOR,
                    child: Text('See Details',style: TextStyle(color: Constant.WHITE_COLOR),),
                    onPressed: () => Navigator.pushNamed(context, Details.id),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
