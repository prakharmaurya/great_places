import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';
import '../helper/db_helper.dart';

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
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }
}
