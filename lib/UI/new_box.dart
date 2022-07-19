import 'package:flutter/material.dart';

class NewBox extends StatelessWidget {
  const NewBox({Key? key, required this.child}) : super(key: key);

  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
          color: Color.fromARGB(224, 240, 234, 255),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const[
            BoxShadow(
              color: Color.fromARGB(255, 205, 132, 251),
              blurRadius: 15,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: Color.fromARGB(255, 250, 224, 224),
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
          ]),
      child: Center(child: child),
    );
  }
}
