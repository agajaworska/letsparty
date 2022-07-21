import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letsparty/app/home/my_account/read%20data/get_user_name.dart';

class MyAccountPageContent extends StatefulWidget {
  MyAccountPageContent({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  State<MyAccountPageContent> createState() => _MyAccountPageContentState();
}

class _MyAccountPageContentState extends State<MyAccountPageContent> {
  final user = FirebaseAuth.instance.currentUser!;
  final storage = FirebaseStorage.instance;

  String userName = '';
  List<String> docId = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docId.add(document.reference.id);
            }));
  }

  File? _image;
  final _picker = ImagePicker();
  final storageRef = FirebaseStorage.instance.ref();

  Future getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    final File image = File(pickedFile!.path);
    //  File image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
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
            _image != null
                ? ClipOval(
                    child: Image.file(
                      _image!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 40),
            Container(
              height: 45,
              width: 350,
              child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: docId.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Center(
                                child: GetUserName(
                              documentId: docId[index],
                            )),
                          );
                        });
                  }),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: 'Imię i nazwisko',
                  hintStyle: GoogleFonts.montserrat(),
                  prefixIcon: const Icon(
                    Icons.text_fields_outlined,
                    color: Color.fromARGB(183, 119, 77, 175),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        userName = widget.controller.text;
                      });
                      FirebaseFirestore.instance
                          .collection('user')
                          .add({'name': userName});
                      widget.controller.clear();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(205, 107, 26, 213),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            MyButton(
              title: 'Wybierz zdjęcie z galerii',
              icon: Icons.photo_album_rounded,
              onClicked: () {
                FirebaseFirestore.instance
                    .collection('image')
                    .add({'image_url': _image});
                getImageFromGallery();
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
        fixedSize: Size(300, 40),
        primary: Color.fromARGB(125, 107, 26, 213),
        onPrimary: Colors.white,
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
