import 'package:favorite_places_app/screens/addPlaces.dart';
import 'package:flutter/material.dart';
// import 'package:favorite_places_app/data/favplacesdata.dart';
import 'package:favorite_places_app/screens/detailscreen.dart';
import 'package:favorite_places_app/model/favplacesmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places_app/providers/userplaces.dart';

class FavPlaces extends ConsumerWidget {
  const FavPlaces({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddPlaces()));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: userPlaces.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage: FileImage(userPlaces[index].image),
                    ),
                    title: Text(
                      userPlaces[index].title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push<FavPlacesModel>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    id: userPlaces[index].id,
                                    title: userPlaces[index].title,
                                    image: userPlaces[index].image,
                                  )));
                    },
                  ),
                )));
  }
}
