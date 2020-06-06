import 'package:flutter/foundation.dart';

import '../models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get items {
    return [..._places];
  }
}
