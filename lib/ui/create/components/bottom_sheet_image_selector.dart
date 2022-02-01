import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetImageSelector extends StatelessWidget {
  final Function onImageSelected;

  const BottomSheetImageSelector({required this.onImageSelected, Key? k})
      : super(key: k);

  void _selectImageFromCamera() async {
    XFile? xImg = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (xImg != null) {
      onImageSelected(File(xImg.path));
    }
  }

  void _selectImageFromGalery() async {
    XFile? xImg = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (xImg != null) {
      onImageSelected(File(xImg.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: Text('Select from Galery',
                style: Theme.of(context).textTheme.headline4),
            onTap: () {
              _selectImageFromGalery();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined),
            title: Text('Take a picture',
                style: Theme.of(context).textTheme.headline4),
            onTap: () {
              _selectImageFromCamera();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    ));
  }
}
