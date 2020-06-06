import 'package:flutter/material.dart';

import './screens/places_list_screen.dart';
import './screens/place_details_screen.dart';
import './screens/add_place_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlacesListScreen(),
      routes: {
        PlaceDetailsScreen.routeName: (context) => PlaceDetailsScreen(),
        AddPlaceScreen.routeName: (context) => AddPlaceScreen(),
      },
    );
  }
}
