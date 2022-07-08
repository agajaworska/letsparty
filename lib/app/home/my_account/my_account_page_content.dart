import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountPageContent extends StatefulWidget {
  MyAccountPageContent({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  final controller = TextEditingController();

  @override
  State<MyAccountPageContent> createState() => _MyAccountPageContentState();
}

class _MyAccountPageContentState extends State<MyAccountPageContent> {
  @override
  var name = '';
  Widget build(BuildContext context) {
    void submit() {
      Navigator.of(context).pop(widget.controller.text);
    }

    Future openDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: TextField(
              decoration: const InputDecoration(
                  hintText: 'Podaj swoje imię i nazwisko'),
              controller: widget.controller,
            ),
            actions: [
              TextButton(
                onPressed: submit,
                child: const Text('Dodaj'),
              ),
            ],
          ),
        );

    return Scaffold(
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
              radius: 130,
            ),
            const SizedBox(height: 60),
            Text(
              name,
              style: GoogleFonts.quicksand(
                  fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () async {
                final name = await openDialog();
                setState(() => this.name = name);
              },
              style: ButtonStyle(),
              child: const Text('Dodaj swoje imię'),
            ),
          ],
        ),
      ),
    );
  }
}
