import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttractionPage extends StatelessWidget {
  const AttractionPage({Key? key}) : super(key: key);

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
        onPressed: () {},
        child: const Icon(
          Icons.add_outlined,
          color: Color.fromARGB(255, 212, 208, 245),
        ),
      ),
      body: ListView(
        children: const [
          AttractionWidget(title: 'Tańce'),
          AttractionWidget(title: 'Hulańce'),
          AttractionWidget(title: 'Swawola'),
          AttractionWidget(title: 'Picie'),
          AttractionWidget(title: 'na umór'),
          AttractionWidget(title: 'pod'),
          AttractionWidget(title: 'mostem'),
          AttractionWidget(title: 'do '),
          AttractionWidget(title: 'białego'),
          AttractionWidget(title: 'rano'),
          AttractionWidget(title: 'hehe'),
          AttractionWidget(title: 'haha'),
          AttractionWidget(title: 'hihi'),
        ],
      ),
    );
  }
}

class AttractionWidget extends StatelessWidget {
  const AttractionWidget({
    Key? key,
    required this.title,
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
