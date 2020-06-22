import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../provider/places_provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<PlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<PlacesProvider>(
                    child: Center(
                      child: const Text('Got no places yet!!!'),
                    ),
                    builder: (ctx, places, ch) => places.items.length <= 0
                        ? ch
                        : ListView.builder(
                            itemBuilder: (c, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  places.items[i].image,
                                ),
                              ),
                              title: Text(
                                places.items[i].title,
                              ),
                              onTap: () {},
                            ),
                            itemCount: places.items.length,
                          ),
                  ),
      ),
    );
  }
}
