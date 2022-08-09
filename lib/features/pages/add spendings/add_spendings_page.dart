import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSpendingsPage extends StatefulWidget {
  const AddSpendingsPage({Key? key}) : super(key: key);

  @override
  State<AddSpendingsPage> createState() => _AddSpendingsPageState();
}

class _AddSpendingsPageState extends State<AddSpendingsPage> {
  String? _name;
  String? _price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        title: Text(
          'W y d a t k i',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('spendings').add(
                {
                  'name': _name,
                  'outgoing': _price,
                },
              );
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: _AddDatePageBody(
        onNameChanged: (newValue) {
          setState(() {
            _name = newValue;
          });
        },
        onPriceChanged: (newValue) {
          setState(() {
            _price = newValue;
          });
        },
      ),
    );
  }
}

class _AddDatePageBody extends StatelessWidget {
  const _AddDatePageBody({
    Key? key,
    required this.onNameChanged,
    required this.onPriceChanged,
  }) : super(key: key);

  final Function(String) onNameChanged;
  final Function(String) onPriceChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onNameChanged,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                width: 2,
                color: Color.fromARGB(183, 119, 77, 175),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                width: 2,
                color: Color.fromARGB(183, 119, 77, 175),
              ),
            ),
            hintText: 'Nazwa wydatku',
            hintStyle: GoogleFonts.montserrat(),
            labelStyle: TextStyle(color: Colors.grey.shade700),
            label: Text(
              'Nazwa wydatku',
              style: GoogleFonts.montserrat(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onPriceChanged,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                width: 2,
                color: Color.fromARGB(183, 119, 77, 175),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                width: 2,
                color: Color.fromARGB(183, 119, 77, 175),
              ),
            ),
            hintText: 'Cena',
            hintStyle: GoogleFonts.montserrat(),
            labelStyle: TextStyle(color: Colors.grey.shade700),
            label: Text(
              'Cena',
              style: GoogleFonts.montserrat(),
            ),
          ),
        ),
      ],
    );
  }
}
