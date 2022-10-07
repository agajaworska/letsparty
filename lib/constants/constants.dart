import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';

const messageTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontFamily: 'Montserrat'),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const messageBoxDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.deepPurple, width: 2.0),
  ),
);
