import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart%20';
import 'package:genielogiciel/controllers/auth_controller.dart';
import 'package:genielogiciel/controllers/location_controller.dart';
import 'package:genielogiciel/controllers/shared_pref.dart';
import 'package:genielogiciel/utils/constants.dart';
import 'package:genielogiciel/utils/custom_slider.dart';
import 'package:genielogiciel/utils/dummy_data.dart';
import 'package:genielogiciel/utils/menu_item.dart';
import 'package:genielogiciel/utils/movies_items.dart';
import 'package:genielogiciel/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    SharedPref.getLocation()
        .then((value) => LocationController.instance.setCity(value));
    super.initState();
  }

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar),
    );
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: picUrl,
                  height: 60.0,
                  width: 60.0,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  DropdownButton<String>(
                      value: city,
                      dropdownColor: MyTheme.statusBar,
                      isDense: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      items: cities
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (st) {
                        setState(() {
                          city = st!;
                        });
                      })
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/search.svg"),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/notification.svg"),
              ),
            ],
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.25,
                  width: size.width,
                  color: Colors.red,
                  child: PageView.builder(
                      itemCount: 3,
                      itemBuilder: (_, i) {
                        return CustomerSlider(
                          index: i,
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text(
                    "SEAT CATEGORIES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                MenuItem(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text(
                    "RECOMMENDED MOvIES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                MoviesItems(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nearby theatres".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: MyTheme.splash,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.2,
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      // _controller.complete(controller);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/spotlights.svg",
                        color: Colors.black.withOpacity(0.8),
                        height: 18.0,
                        width: 18.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Events".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: MyTheme.splash,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
