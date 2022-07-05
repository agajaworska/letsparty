import 'package:flutter/material.dart';

class NewBox extends StatelessWidget {
  const NewBox({Key? key, required this.child}) : super(key: key);

  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 234, 255),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: Color.fromARGB(255, 232, 222, 240),
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
          ]),
      child: Center(child: child),
    );
  }
}
