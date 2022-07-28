import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePage extends StatelessWidget {
  const DatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        title: Text(
          'M e n u',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 107, 26, 213),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Podaj informacje"),
                content: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Wpisz adres',
                  ),
                ),
                actions: [
                  Column(
                    children: [
                      Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Wybierz datę i godzinę")),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("OK"),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add_outlined,
          color: Color.fromARGB(255, 212, 208, 245),
        ),
      ),
    );
  }
}
