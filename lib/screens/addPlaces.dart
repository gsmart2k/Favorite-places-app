import 'package:favorite_places_app/widgets/addImage.dart';
import 'package:favorite_places_app/screens/favplaces.dart';
import 'package:favorite_places_app/widgets/add_location.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places_app/providers/userplaces.dart';

class AddPlaces extends ConsumerStatefulWidget {
  const AddPlaces({super.key});

  @override
  ConsumerState<AddPlaces> createState() {
    return _AddPlacesState();
  }
}

class _AddPlacesState extends ConsumerState<AddPlaces> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    var enteredText = _titleController.text;

    if (enteredText.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredText, _selectedImage!);
    Navigator.pop(context, const FavPlaces());
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add New Place")),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 250,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              const SizedBox(height: 10),
              PlacesImage(
                onPickImage: (image) {
                  _selectedImage = image;
                },
              ), //Image Input
              const SizedBox(height: 10),
              LocationInput(),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                  onPressed: _savePlace,
                  label: const Text('Add New Place'),
                  icon: const Icon(Icons.add))
            ],
          ),
        ));
  }
}
