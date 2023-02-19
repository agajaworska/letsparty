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

BoxDecoration inactiveBoxDecoration({required String iconPath}) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        iconPath,
      ),
      alignment: Alignment.bottomRight,
      scale: 6,
    ),
    color: const Color.fromARGB(255, 249, 193, 195),
    borderRadius: BorderRadius.circular(25.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        blurRadius: 1,
        offset: Offset(4, 4),
      ),
      BoxShadow(
        color: Color.fromARGB(255, 252, 230, 188),
        offset: Offset(-3, -3),
      ),
    ],
    gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 249, 193, 195),
          Color.fromARGB(255, 249, 193, 195),
        ],
        stops: [
          0.1,
          0.9
        ]),
  );
}

ButtonStyle elevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(12.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: const Color.fromARGB(255, 249, 143, 103),
    shadowColor: Colors.black87,
    elevation: 4.0,
    textStyle: GoogleFonts.montserrat(fontSize: 18),
  );
}

InputDecoration textFieldDecoration({
  required String text,
  required Icon icon,
}) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(
        width: 2,
        color: Color.fromARGB(255, 249, 193, 195),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(
        width: 3,
        color: Color.fromARGB(255, 249, 193, 195),
      ),
    ),
    hintText: text,
    labelText: text,
    labelStyle: const TextStyle(
      color: Colors.black54,
    ),
    hintStyle: const TextStyle(fontFamily: 'Montserrat'),
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
        color: const Color.fromARGB(255, 245, 232, 206),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4), blurRadius: 2.0, color: Colors.black87),
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

class NewBox extends StatelessWidget {
  const NewBox({
    Key? key,
    required this.child,
    required this.boxDecoration,
  }) : super(key: key);

  final Widget child;
  final BoxDecoration boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: boxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
