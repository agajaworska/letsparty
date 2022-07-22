import 'dart:math';

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
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 380.0,
            height: 60.0,
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
              'dsd',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
