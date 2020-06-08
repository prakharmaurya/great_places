import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get items {
    return [..._places];
  }

  void addPlace(
    String pickedTitle,
    File pickedImage,
  ) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
      location: null,
    );
    _places.add(newPlace);
    notifyListeners();
  }
}
