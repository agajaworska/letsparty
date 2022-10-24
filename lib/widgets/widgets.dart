import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/domain/models/date_model.dart';
import 'package:letsparty/domain/models/theme_model.dart';

const messageTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontFamily: 'Montserrat'),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const messageBoxDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xFF332A6F), width: 2.0),
  ),
);

final inactiveBoxDecoration = BoxDecoration(
  color: const Color.fromARGB(255, 212, 208, 245),
  borderRadius: BorderRadius.circular(25.0),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(255, 83, 80, 85),
      blurRadius: 15,
      offset: Offset(5, 5),
    ),
    BoxShadow(
      color: Color.fromARGB(246, 253, 250, 255),
      blurRadius: 16,
      offset: Offset(-4, -4),
    ),
  ],
  gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(93, 183, 178, 229),
        Color.fromARGB(255, 195, 191, 231),
      ],
      stops: [
        0.1,
        0.9
      ]),
);

final activeBoxDecoration = BoxDecoration(
  color: const Color.fromARGB(255, 212, 208, 245),
  borderRadius: BorderRadius.circular(25.0),
  boxShadow: [
    BoxShadow(
      spreadRadius: -2.0,
      color: Colors.grey.shade200,
      blurRadius: 14.0,
    ),
  ],
  gradient: const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color.fromARGB(255, 225, 222, 255),
        Color.fromARGB(172, 172, 169, 205),
      ],
      stops: [
        0.3,
        0.9,
      ]),
);

ButtonStyle elevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: const Color(0xFF332A6F),
    shadowColor: Colors.grey,
    elevation: 6.0,
    textStyle: GoogleFonts.montserrat(),
  );
}

InputDecoration textFieldDecoration({
  required String text,
  required Icon icon,
  TextStyle? textColor,
}) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(width: 2, color: Color(0xFF332A6F)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(width: 2, color: Color(0xFF332A6F)),
    ),
    hintText: text,
    labelText: text,
    labelStyle: const TextStyle(
      color: Color(0xFF332A6F),
    ),
    hintStyle: GoogleFonts.montserrat(),
    prefixIcon: icon,
  );
}

class DisplayBox extends StatelessWidget {
  const DisplayBox({
    this.dateModel,
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;
  final DateModel? dateModel;

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
            offset: Offset(-5, -5),
            blurRadius: 6.0,
            color: Color.fromARGB(255, 232, 222, 240),
          ),
        ],
      ),
      child: Text(
        name,
        style: GoogleFonts.montserrat(
          fontSize: 18,
        ),
      ),
    );
  }
}

class ThemeImageWidget extends StatelessWidget {
  const ThemeImageWidget({
    Key? key,
    required this.themeModel,
  }) : super(key: key);

  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: Offset(-5, -5),
            blurRadius: 6.0,
            color: Color.fromARGB(255, 232, 222, 240),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            themeModel.imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
