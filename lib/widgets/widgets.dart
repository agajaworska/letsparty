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
  DisplayBox({
    this.dateModel,
    required this.name,
    Key? key,
  }) : super(key: key);

  String name;
  DateModel? dateModel;

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
