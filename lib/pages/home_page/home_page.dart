import 'package:flutter/material.dart';
import 'package:letsparty/features/new_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: NewBox(
            child: Icon(Icons.abc_rounded),
          ),
        ),
      ),
    );
  }
}
