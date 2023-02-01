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

// final inactiveBoxDecoration = BoxDecoration(
//   image: const DecorationImage(
//     image: AssetImage(
//       'images/fast-food.png',
//     ),
//     alignment: Alignment.bottomRight,
//     scale: 6,
//     colorFilter:
//         ColorFilter.mode(Color.fromARGB(46, 194, 1, 72), BlendMode.modulate),
//   ),
//   color: const Color(0xFFC0C2CE),
//   borderRadius: BorderRadius.circular(25.0),
//   boxShadow: const [
//     BoxShadow(
//       color: Color.fromARGB(255, 83, 80, 85),
//       blurRadius: 15,
//       offset: Offset(5, 5),
//     ),
//     BoxShadow(
//       color: Color.fromARGB(246, 253, 250, 255),
//       blurRadius: 16,
//       offset: Offset(-4, -4),
//     ),
//   ],
//   gradient: const LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: [
//         Color.fromARGB(128, 192, 194, 206),
//         Color(0xFFC0C2CE),
//       ],
//       stops: [
//         0.1,
//         0.9
//       ]),
// );

final activeBoxDecoration = BoxDecoration(
  color: const Color.fromARGB(255, 249, 143, 103),
  borderRadius: BorderRadius.circular(25.0),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(87, 32, 31, 31),
      blurRadius: 8.0,
      offset: Offset(-2, -2),
    ),
    BoxShadow(
      color: Colors.black,
      blurRadius: 1,
      offset: Offset(4, 4),
    ),
  ],
);

ButtonStyle elevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(12.0),
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
