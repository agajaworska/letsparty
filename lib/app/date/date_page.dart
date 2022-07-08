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
          'G d z i e  i  k i e d y',
          style: GoogleFonts.bebasNeue(
            fontSize: 28,
            color: Colors.grey.shade900,
          ),
        ),
      ),
    );
  }
}
