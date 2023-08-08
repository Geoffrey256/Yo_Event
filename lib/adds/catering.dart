import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:universal_io/io.dart';

import 'dart:io';


class AdvertForm extends StatefulWidget {
  @override
  _AdvertFormState createState() => _AdvertFormState();
}

class _AdvertFormState extends State<AdvertForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController socialMediaController = TextEditingController();

  List<XFile>? _pickedImages;
  XFile? _pickedVideo;
  VideoPlayerController? _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  // Method to pick images from the gallery
  Future<void> _pickImages() async {
    final imagePicker = ImagePicker();
    _pickedImages = await imagePicker.pickMultiImage();
    setState(() {});
  }

  // Method to pick a video from the gallery
  Future<void> _pickVideo() async {
    final imagePicker = ImagePicker();
    _pickedVideo = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (_pickedVideo != null) {
      _videoPlayerController =
          VideoPlayerController.file(File(_pickedVideo!.path))
            ..initialize().then((_) {
              setState(() {});
            });
    }
  }

  // Method to save the advertisement data to Firestore
  // Future<void> _saveAdvertisement() async {
  //   try {
  //     await FirebaseFirestore.instance.collection('advertisements').add({
  //       'name': nameController.text,
  //       'description': descriptionController.text,
  //       'location': locationController.text,
  //       'size': sizeController.text,
  //       'contact': contactController.text,
  //       'email': emailController.text,
  //       'social_media': socialMediaController.text,
  //     });
  //     // Clear the form fields after successful submission
  //     nameController.clear();
  //     descriptionController.clear();
  //     locationController.clear();
  //     sizeController.clear();
  //     contactController.clear();
  //     emailController.clear();
  //     socialMediaController.clear();
  //     _pickedImages = null;
  //     _pickedVideo = null;
  //     _videoPlayerController?.dispose();
  //     setState(() {});
  //   } catch (e) {
  //     print('Error saving advertisement: $e');
  //   }
  // }

  //Alternatively

  // Method to save the advertisement data to Firestore
  Future<void> _saveAdvertisement() async {
    try {
      await FirebaseFirestore.instance.collection('advertisements').add({
        'name': nameController.text,
        'description': descriptionController.text,
        'location': locationController.text,
        'size': sizeController.text,
        'contact': contactController.text,
        'email': emailController.text,
        'social_media': socialMediaController.text,
      });
      // Clear the form fields after successful submission
      nameController.clear();
      descriptionController.clear();
      locationController.clear();
      sizeController.clear();
      contactController.clear();
      emailController.clear();
      socialMediaController.clear();
      _pickedImages = null;
      _pickedVideo = null;
      _videoPlayerController?.dispose();
      setState(() {});
    } catch (e) {
      print('Error saving advertisement: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Advertisement'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration:
                    InputDecoration(labelText: 'Name of Service Provider'),
              ),
              // Add more form fields for other items (description, location, size, contact, etc.)

              // Widget to show selected images
              if (_pickedImages != null)
                Column(
                  children: [
                    Text('Selected Images:'),
                    Wrap(
                      spacing: 8.0,
                      children: _pickedImages!
                          .map((image) => Image.file(File(image.path),
                              width: 100, height: 100))
                          .toList(),
                    ),
                  ],
                ),

              // Widget to show selected video
              if (_pickedVideo != null)
                Column(
                  children: [
                    Text('Selected Video:'),
                    _videoPlayerController != null
                        ? AspectRatio(
                            aspectRatio:
                                _videoPlayerController!.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController!),
                          )
                        : Container(),
                  ],
                ),

              ElevatedButton(
                onPressed: _pickImages,
                child: Text('Pick Images'),
              ),

              ElevatedButton(
                onPressed: _pickVideo,
                child: Text('Pick Video'),
              ),

              ElevatedButton(
                onPressed: _saveAdvertisement,
                child: Text('Post Advertisement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class AdvertisementForm extends StatefulWidget {
  @override
  _AdvertisementFormState createState() => _AdvertisementFormState();
}

class _AdvertisementFormState extends State<AdvertisementForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController socialMediaController = TextEditingController();

  List<XFile>? _pickedImages;
  XFile? _pickedVideo;
  VideoPlayerController? _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  // Method to pick images from the gallery
  Future<void> _pickImages() async {
    final imagePicker = ImagePicker();
    _pickedImages = await imagePicker.pickMultiImage();
    setState(() {});
  }

  // Method to pick a video from the gallery
  Future<void> _pickVideo() async {
    final imagePicker = ImagePicker();
    _pickedVideo = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (_pickedVideo != null) {
      _videoPlayerController = VideoPlayerController.file(File(_pickedVideo!.path))
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  // Method to save the advertisement data to Firestore
  Future<void> _saveAdvertisement() async {
    try {
      if (nameController.text.isEmpty ||
          descriptionController.text.isEmpty ||
          locationController.text.isEmpty ||
          sizeController.text.isEmpty ||
          contactController.text.isEmpty ||
          emailController.text.isEmpty ||
          socialMediaController.text.isEmpty ||
          _pickedImages == null ||
          _pickedImages!.isEmpty ||
          _pickedVideo == null) {
        // Show an error dialog if any required field is empty or no images or video is selected.
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields and select images and a video.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      // Save the advertisement data to Firestore
      final advertisementRef = FirebaseFirestore.instance.collection('advertisements').doc();
      await advertisementRef.set({
        'name': nameController.text,
        'description': descriptionController.text,
        'location': locationController.text,
        'size': sizeController.text,
        'contact': contactController.text,
        'email': emailController.text,
        'social_media': socialMediaController.text,
      });

      // Save images and video URLs in Firestore storage (not implemented in this example)

      // Clear the form fields after successful submission
      nameController.clear();
      descriptionController.clear();
      locationController.clear();
      sizeController.clear();
      contactController.clear();
      emailController.clear();
      socialMediaController.clear();
      _pickedImages = null;
      _pickedVideo = null;
      _videoPlayerController?.dispose();
      setState(() {});

      // Show a success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Advertisement posted successfully.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      print('Error saving advertisement: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Advertisement'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name of Service Provider'),
              ),
              // Add more form fields for other items (description, location, size, contact, etc.)

              // Widget to show selected images
              if (_pickedImages != null)
                Column(
                  children: [
                    Text('Selected Images:'),
                    Wrap(
                      spacing: 8.0,
                      children: _pickedImages!.map((image) => Image.file(File(image.path), width: 100, height: 100)).toList(),
                    ),
                  ],
                ),

              // Widget to show selected video
              if (_pickedVideo != null)
                Column(
                  children: [
                    Text('Selected Video:'),
                    _videoPlayerController != null
                        ? AspectRatio(
                            aspectRatio: _videoPlayerController!.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController!),
                          )
                        : Container(),
                  ],
                ),

              ElevatedButton(
                onPressed: _pickImages,
                child: Text('Pick Images'),
              ),

              ElevatedButton(
                onPressed: _pickVideo,
                child: Text('Pick Video'),
              ),

              ElevatedButton(
                onPressed: _saveAdvertisement,
                child: Text('Post Advertisement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
