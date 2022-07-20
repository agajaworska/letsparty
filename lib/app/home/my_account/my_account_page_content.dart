import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountPageContent extends StatefulWidget {
  const MyAccountPageContent({Key? key}) : super(key: key);

  @override
  State<MyAccountPageContent> createState() => _MyAccountPageContentState();
}

class _MyAccountPageContentState extends State<MyAccountPageContent> {
  final controller = TextEditingController();
  File? image;

  String userName = '';

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        title: Text(
          'M o j e  k o n t o',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout_outlined),
            color: Colors.grey.shade900,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            image != null
                ? ClipOval(
                    child: Image.file(
                      image!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 40),
            Container(
              child: Text(userName),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Imię i nazwisko',
                  hintStyle: GoogleFonts.montserrat(),
                  prefixIcon: const Icon(
                    Icons.text_fields_outlined,
                    color: Color.fromARGB(183, 119, 77, 175),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = controller.text;
                });
                FirebaseFirestore.instance
                    .collection('user')
                    .add({'name': userName});
                controller.clear();
              },
              child: const Text('Dodaj'),
            ),
            const SizedBox(height: 25),
            MyButton(
              title: 'Wybierz zdjęcie z galerii',
              icon: Icons.photo_album_rounded,
              onClicked: () {
                FirebaseFirestore.instance
                    .collection('user')
                    .add({'image_url': image.toString()});
                pickImage();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({
    required this.title,
    required this.icon,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  String title;
  IconData icon;
  VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        primary: Colors.pink,
        onPrimary: Colors.yellow,
        textStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 25),
          const SizedBox(
            width: 16,
          ),
          Text(title),
        ],
      ),
      onPressed: onClicked,
    );
  }
}
