import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemePage extends StatelessWidget {
  ThemePage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        title: Text(
          'M o t y w  i m p r e z y',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream:
            FirebaseFirestore.instance.collection('themePhotos').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Trwa ładowanie danych');
          }

          final documents = snapshot.data!.docs;

          return GridView.count(
            crossAxisCount: 2,
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Dismissible(
                    key: ValueKey(document.id),
                    onDismissed: (_) {
                      FirebaseFirestore.instance
                          .collection('themePhotos')
                          .doc(document.id)
                          .delete();
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 234, 255),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(5, 5),
                            blurRadius: 6.0,
                            color: Colors.grey.shade600,
                          ),
                          const BoxShadow(
                            offset: const Offset(-5, -5),
                            blurRadius: 6.0,
                            color: const Color.fromARGB(255, 232, 222, 240),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            document['image_url'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  style: GoogleFonts.montserrat(),
                  decoration: InputDecoration(
                    hintText: 'Dodaj link do zdjęcia',
                    hintStyle: GoogleFonts.montserrat(),
                    prefixIcon: const Icon(
                      Icons.image_outlined,
                      color: Color.fromARGB(183, 119, 77, 175),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('themePhotos')
                            .add({'image_url': controller.text});
                        controller.clear;
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromARGB(205, 107, 26, 213),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
