import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountPageContent extends StatelessWidget {
  MyAccountPageContent({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        appBar: AppBar(
          title: Text(
            'T w o j e   k o n t o',
            style: GoogleFonts.bebasNeue(
              fontSize: 28,
              color: Colors.grey.shade900,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.grey.shade900,
              ),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/kot.jpeg'),
                radius: 110,
              ),
              const SizedBox(height: 20),
              StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('name').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Wystąpił nieoczekiwany problem');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final document = snapshot.data!.docs;

                    return TextField(
                      controller: controller,
                      onTap: () {
                        FirebaseFirestore.instance.collection('name').add(
                          {'title': controller.text},
                        );

                        controller.clear();
                      },
                      readOnly: true,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
