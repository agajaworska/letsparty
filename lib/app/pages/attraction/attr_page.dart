import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttractionPage extends StatelessWidget {
  AttractionPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        title: Text(
          'A t r a k c j e',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 107, 26, 213),
        onPressed: () {
          FirebaseFirestore.instance.collection('attraction').add(
            {'title': controller.text},
          );
          controller.clear();
        },
        child: const Icon(
          Icons.add_outlined,
          color: Color.fromARGB(255, 212, 208, 245),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('attraction').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }

          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection('attraction')
                        .doc(document.id)
                        .delete();
                  },
                  child: AttractionWidget(document['title']),
                ),
              ],
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  style: GoogleFonts.montserrat(),
                  decoration: InputDecoration(
                    hintText: 'Podaj propozycję atrakcji',
                    hintStyle: GoogleFonts.montserrat(),
                    prefixIcon: const Icon(
                      Icons.star_border_outlined,
                      color: Color.fromARGB(183, 119, 77, 175),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class AttractionWidget extends StatelessWidget {
  const AttractionWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
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
      ),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}